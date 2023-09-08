# frozen_string_literal: true

require_relative '../../lib/ebnf'
puts
File.dirname(__FILE__)
grammar = EBNF.parse(File.open(__dir__+"/calc.ebnf"))
peg = grammar.make_peg
ruby_code = grammar.to_ruby

puts "-----"
puts peg
puts "-----"
puts ruby_code
puts "-----"


puts grammar.build_tables
puts grammar.to_ruby