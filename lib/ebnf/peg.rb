module EBNF
  module PEG
    autoload :Parser, 'ebnf/peg/parser'
    autoload :Rule, 'ebnf/peg/rule'

    ##
    # Transform EBNF Rule set for PEG parsing:
    #
    #   * Transform each rule into a set of sub-rules extracting unnamed sequences into new rules, using {Rule#to_peg}.
    # @return [ENBF] self
    def make_peg
      progress("make_peg") {"Start: #{@ast.length} rules"}
      new_ast = []

      ast.each do |rule|
        debug("make_peg") {"expand from: #{rule.inspect}"}
        new_rules = rule.to_peg
        debug(" => ") {new_rules.map(&:sym).join(', ')}
        new_ast += new_rules
      end

      @ast = new_ast
      progress("make_peg") {"End: #{@ast.length} rules"}
      self
    end
  end
end
