# frozen_string_literal: true

require_relative '../../lib/ebnf'
File.dirname(__FILE__)
grammar = EBNF.parse(File.open(__dir__+"/calc.ebnf"))

puts "sxp:-----"
puts grammar.to_sxp
puts "Ruby Code: -----"
puts grammar.to_ruby
puts "string -----"
puts grammar.to_s


#puts grammar.build_tables
#puts grammar.to_ruby