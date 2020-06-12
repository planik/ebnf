module EBNF::PEG
  ##
  # A Generic PEG parser using the parsed rules modified for PEG parseing.
  module Parser
    ##
    # @return [Regexp, Rule] how to remove inter-rule whitespace
    attr_reader :whitespace

    def self.included(base)
      base.extend(ClassMethods)
    end

    # DSL for creating terminals and productions
    module ClassMethods
      def start_handlers; (@start_handlers ||= {}); end
      def production_handlers; (@production_handlers ||= {}); end
      def terminal_handlers; (@terminal_handlers ||= {}); end
      def terminal_regexps; (@terminal_regexps ||= {}); end

      ##
      # Defines the pattern for a terminal node and a block to be invoked
      # when ther terminal is encountered. If the block is missing, the
      # value of the terminal will be placed on the input hash to be returned
      # to a previous production. Block is called in an evaluation block from
      # the enclosing parser.
      #
      # @param [Symbol] term
      #   The terminal name.
      # @param [Regexp] regexp (nil)
      #   Pattern used to scan for this terminal,
      #   defaults to the expression defined in the associated rule.
      #   If unset, the terminal rule is used for matching.
      # @param [Hash] options
      # @option options [Hash{String => String}] :map ({})
      #   A mapping from terminals, in lower-case form, to
      #   their canonical value
      # @option options [Boolean] :unescape
      #   Cause strings and codepoints to be unescaped.
      # @yield [term, value]
      # @yieldparam [Symbol] term
      #   A symbol indicating the production which referenced this terminal
      # @yieldparam [String] value
      #   The scanned terminal value.
      # @yieldparam [Proc] block
      #   Block passed to initialization for yielding to calling parser.
      #   Should conform to the yield specs for #initialize
      def terminal(term, regexp = nil, **options, &block)
        terminal_regexps[term] = regexp if regexp
        terminal_handlers[term] = block
      end

      ##
      # Defines a production called at the beggining of a particular production
      # with data from previous production along with data defined for the
      # current production. Block is called in an evaluation block from
      # the enclosing parser.
      #
      # @param [Symbol] term
      #   The rule name
      # @yield [data, block]
      # @yieldparam [Hash] data
      #   A Hash defined for the current production, during :start
      #   may be initialized with data to pass to further productions,
      #   during :finish, it contains data placed by earlier productions
      # @yieldparam [Proc] block
      #   Block passed to initialization for yielding to calling parser.
      #   Should conform to the yield specs for #initialize
      # Yield to generate a triple
      def start_production(term, &block)
        start_handlers[term] = block
      end

      ##
      # Defines a production called when production of associated
      # non-terminals has completed
      # with data from previous production along with data defined for the
      # current production. Block is called in an evaluation block from
      # the enclosing parser.
      #
      # @param [Symbol] term
      #   Term which is a key in the branch table
      # @yield [data, result, block]
      # @yieldparam [Hash] data
      #   A Hash defined for the current production, during :start
      #   may be initialized with data to pass to further productions,
      #   during :finish, it contains data placed by earlier productions
      # @yieldparam [Object] result
      #   The result from sucessfully parsing the production.
      # @yieldparam [Proc] block
      #   Block passed to initialization for yielding to calling parser.
      #   Should conform to the yield specs for #initialize
      # @yieldreturn [Object] the result of this production.
      # Yield to generate a triple
      def production(term, &block)
        production_handlers[term] = block
      end

      # Evaluate a handler, delegating to the specified object.
      # This is necessary so that handlers can operate within the
      # binding context of the parser in which they're invoked.
      # @param [Object] object
      # @return [Object]
      def eval_with_binding(object)
        @delegate = object
        object.instance_eval {yield}
      end

      private

      def method_missing(method, *args, &block)
        if @delegate ||= nil
          # special handling when last arg is **options
          params = @delegate.method(method).parameters
          if params.any? {|t, _| t == :keyrest} && args.last.is_a?(Hash)
            opts = args.pop
            @delegate.send(method, *args, **opts, &block)
          else
            @delegate.send(method, *args, &block)
          end
        else
          super
        end
      end
    end

    ##
    # Initializes a new parser instance.
    #
    # @param  [String, #to_s] input
    # @param [Symbol, #to_s] start
    #   The starting production for the parser. It may be a URI from the grammar, or a symbol representing the local_name portion of the grammar URI.
    # @param [Array<EBNF::PEG::Rule>] rules
    #   The parsed rules, which control parsing sequence.
    #   Identify the symbol of the starting rule with `start`.
    # @param  [Hash{Symbol => Object}] options
    # @option options [Boolean] :debug
    #   Detailed debug output
    # @option options[Integer] :high_water passed to lexer
    # @option options [Logger] :logger for errors/progress/debug.
    # @option options[Integer] :low_water passed to lexer
    # @option options [Boolean] :progress
    #   Show progress of parser productions    # @opt
    # @option options [Symbol, Regexp] :whitespace 
    #   Symbol of whitespace rule (defaults to `@pass`), or a regular expression
    #   for eating whitespace between non-terminal rules (strongly encouraged).
    # @yield [context, *data]
    #   Yields to return data to parser
    # @yieldparam [:statement, :trace] context
    #   Context for block
    # @yieldparam [Symbol] *data
    #   Data specific to the call
    # @return [Object] AST resulting from parse
    # @raise [Exception] Raises exceptions for parsing errors
    #   or errors raised during processing callbacks. Internal
    #   errors are raised using {Error}.
    def parse(input = nil, start = nil, rules = [], **options, &block)
      @rules = rules.inject({}) {|memo, rule| memo.merge(rule.sym => rule)}

      # Add parser reference to each rule
      @rules.each_value {|rule| rule.parser = self}

      # Take whitespace from options, a named rule, a `pass` rule, a rule named :WS, or a default
      @whitespace = case options[:whitespace]
      when Regexp then options[:whitespace]
      when Symbol then @rules[options[:whitespace]]
      end ||
        @rules.values.detect(&:pass?) ||
        /(?:\s|(?:#[^x][^\n\r]*))+/m.freeze

      @options = options.dup
      @options[:debug] ||= case
      when @options[:progress] then 2
      when @options[:validate] then 1
      end
      @productions = []
      @parse_callback = block
      @error_log = []
      @prod_data = [{}]

      scanner = EBNF::LL1::Scanner.new(input)
      start = start.split('#').last.to_sym unless start.is_a?(Symbol)
      start_rule = @rules[start]
      raise Error, "Starting production not defined" unless start_rule

      result = start_rule.parse(scanner)
      if result == :unmatched
        # Start rule wasn't matched, which is about the only error condition
        error("--top--", "Parse failed #{result}", pos: scanner.pos, lineno: scanner.lineno)
      end

      # Eat any remaining whitespace
      start_rule.eat_whitespace(scanner)
      if !scanner.eos?
        error("--top--", "Parse completed with unconsumed input #{result}",
              pos: scanner.pos,
              lineno: scanner.lineno,
              rest: scanner.rest[0..100])
      end

      # When all is said and done, raise the error log
      unless @error_log.empty?
        raise Error, @error_log.join("\n")
      end

      result
    end

    # Depth of parsing, for log output.
    def depth; (@productions || []).length; end

    # Current ProdData element
    def prod_data; @prod_data.last; end

    ##
    # Error information, used as level `0` debug messages.
    #
    # @param [String] node Relevant location associated with message
    # @param [String] message Error string
    # @param [Hash{Symbol => Object}] options
    # @option options [URI, #to_s] :production
    # @option options [String] :rest
    # @see #debug
    def error(node, message, **options)
      lineno = options[:lineno]
      m = "ERROR "
      m += "[line: #{lineno}] " if lineno
      m += message
      m += " (found #{options[:rest].inspect})" if options[:rest]
      m += ", production = #{options[:production].inspect}" if options[:production]
      @error_log << m unless @recovering
      @recovering = true
      debug(node, m, level: 3, **options)
      if options[:raise] || @options[:validate]
        raise Error.new(m, lineno: lineno, rest: options[:rest], production: options[:production])
      end
    end

    ##
    # Warning information, used as level `1` debug messages.
    #
    # @param [String] node Relevant location associated with message
    # @param [String] message Error string
    # @param [Hash] options
    # @option options [URI, #to_s] :production
    # @option options [String] :rest
    # @see #debug
    def warn(node, message, **options)
      lineno = options[:lineno]
      m = "WARNING "
      m += "[line: #{lineno}] " if lineno
      m += message
      m += " (found #{options[:rest].inspect})" if options[:rest]
      m += ", production = #{options[:production].inspect}" if options[:production]
      debug(node, m, level: 2, **options)
    end

    ##
    # Progress output when parsing. Passed as level `2` debug messages.
    #
    # @overload progress(node, message, **options)
    #   @param [String] node Relevant location associated with message
    #   @param [String] message ("")
    #   @param [Hash] options
    #   @option options [Integer] :depth
    #       Recursion depth for indenting output
    # @see #debug
    def progress(node, *args, &block)
      return unless @options[:progress] || @options[:debug]
      args << {} unless args.last.is_a?(Hash)
      args.last[:level] ||= 1
      debug(node, *args, &block)
    end

    ##
    # Progress output when debugging.
    #
    # The call is ignored, unless `@options[:debug]` is set, in which
    # case it yields tracing information as indicated. Additionally,
    # if `@options[:debug]` is an Integer, the call is aborted if the
    # `:level` option is less than than `:level`.
    #
    # @overload debug(node, message, **options)
    #   @param [Array<String>] args Relevant location associated with message
    #   @param [Hash] options
    #   @option options [Integer] :depth
    #     Recursion depth for indenting output
    #   @option options [Integer] :level
    #     Level assigned to message, by convention, level `0` is for
    #     errors, level `1` is for warnings, level `2` is for parser
    #     progress information, and anything higher is for various levels
    #     of debug information.
    #
    # @yield trace, level, lineno, depth, args
    # @yieldparam [:trace] trace
    # @yieldparam [Integer] level
    # @yieldparam [Integer] lineno
    # @yieldparam [Integer] depth Recursive depth of productions
    # @yieldparam [Array<String>] args
    # @yieldreturn [String] added to message
    def debug(*args)
      return unless @options[:logger] || @parse_callback
      options = args.last.is_a?(Hash) ? args.pop : {}
      lineno = options[:lineno]
      level = options.fetch(:level, 0)

      depth = options[:depth] || self.depth
      args << yield if block_given?
      if @options[:logger]
        @options[:logger].add(level, "[#{lineno}]" + (" " * depth) + args.join(" "))
      else
        @parse_callback.call(:trace, level, lineno, depth, *args)
      end
    end

    # Start for production
    # Adds data avoiable during the processing of the production
    def onStart(prod, scanner: nil)
      handler = self.class.start_handlers[prod]
      @productions << prod
      progress("#{prod}(:start)", "", depth: (depth + 1)) {"#{prod}, lineno: #{scanner ? scanner.lineno : '?'}, pos: #{scanner ? scanner.pos : '?'}, rest: #{scanner ? scanner.rest[0..20].inspect : '?'}"}
      if handler
        # Create a new production data element, potentially allowing handler
        # to customize before pushing on the @prod_data stack
        data = {}
        begin
          self.class.eval_with_binding(self) {
            handler.call(data, @parse_callback)
          }
        rescue ArgumentError, Error => e
          error("start", "#{e.class}: #{e.message}", production: prod)
          @recovering = false
        end
        @prod_data << data
      elsif self.class.production_handlers[prod]
        # Make sure we push as many was we pop, even if there is no
        # explicit start handler
        @prod_data << {}
      end
    end

    # Finish of production
    #
    # @param [Object] result parse result
    # @return [Object] parse result, or the value returned from the handler
    def onFinish(result, scanner: nil)
      #puts "prod_data(f): " + @prod_data.inspect
      prod = @productions.last
      handler = self.class.production_handlers[prod]
      if handler && !@recovering && result != :unmatched
        # Pop production data element from stack, potentially allowing handler to use it
        data = @prod_data.pop
        result = begin
          self.class.eval_with_binding(self) {
            handler.call(data, result, @parse_callback)
          }
        rescue ArgumentError, Error => e
          error("finish", "#{e.class}: #{e.message}", production: prod)
          @recovering = false
        end
      end
      progress("#{prod}(:finish)", "", depth: (depth + 1)) {"#{prod}: #{result.inspect}, lineno: #{scanner ? scanner.lineno : '?'}, pos: #{scanner ? scanner.pos : '?'}, rest: #{scanner ? scanner.rest[0..20].inspect : '?'}"}
      @productions.pop
      result
    end

    # A terminal with a defined handler
    #
    # @param [Symbol] prod from the symbol of the associated rule
    # @param [String] token the scanned string
    # @return [String, Object] either the result from the handler, or the token
    def onTerminal(prod, token, scanner: nil)
      parentProd = @productions.last
      handler = self.class.terminal_handlers[prod]
      if handler && token != :unmatched
        token = begin
          self.class.eval_with_binding(self) {
            handler.call(parentProd, token, @parse_callback)
          }
        rescue ArgumentError, Error => e
          error("terminal", "#{e.class}: #{e.message}", token: token, production: prod)
          @recovering = false
        end
      end
      progress("#{prod}(:terminal)", "", depth: (depth + 2)) {"#{prod}: #{token.inspect}, lineno: #{scanner ? scanner.lineno : '?'}, pos: #{scanner ? scanner.pos : '?'}"}
      token
    end

    ##
    # Find a rule for a symbol
    #
    # @param [Symbol] sym
    # @return [Rule]
    def find_rule(sym)
      @rules[sym]
    end

    ##
    # Find a regular expression defined for a terminal
    #
    # @param [Symbol] sym
    # @return [Regexp]
    def find_terminal_regexp(sym)
      self.class.terminal_regexps[sym]
    end

  public

    ##
    # Raised for errors during parsing.
    #
    # @example Raising a parser error
    #   raise Error.new(
    #     "invalid token '%' on line 10",
    #     rest: '%', lineno: 9, production: :turtleDoc)
    #
    # @see https://ruby-doc.org/core/classes/StandardError.html
    class Error < StandardError
      ##
      # The current production.
      #
      # @return [Symbol]
      attr_reader :production

      ##
      # The read head when scanning failed
      #
      # @return [String]
      attr_reader :rest

      ##
      # The line number where the error occurred.
      #
      # @return [Integer]
      attr_reader :lineno

      ##
      # Initializes a new lexer error instance.
      #
      # @param  [String, #to_s]          message
      # @param  [Hash{Symbol => Object}] options
      # @option options [Symbol]         :production  (nil)
      # @option options [String]         :rest  (nil)
      # @option options [Integer]        :lineno (nil)
      def initialize(message, **options)
        @production = options[:production]
        @rest       = options[:rest]
        @lineno     = options[:lineno]
        super(message.to_s)
      end
    end # class Error
  end # class Parser
end # module EBNF::LL1
