# This file is automatically generated by ebnf version 2.3.4
# Derived from etc/ebnf.ebnf
module Meta
  START = :ebnf
  BRANCH = {
    :alt => {
      "(" => [:seq, :_alt_1],
      :HEX => [:seq, :_alt_1],
      :O_RANGE => [:seq, :_alt_1],
      :RANGE => [:seq, :_alt_1],
      :STRING1 => [:seq, :_alt_1],
      :STRING2 => [:seq, :_alt_1],
      :SYMBOL => [:seq, :_alt_1],
    },
    :_alt_1 => {
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      :LHS => [],
      "|" => [:_alt_3],
    },
    :_alt_2 => {
      "|" => ["|", :seq],
    },
    :_alt_3 => {
      "|" => [:_alt_2, :_alt_1],
    },
    :declaration => {
      "@pass" => [:pass],
      "@terminals" => ["@terminals"],
    },
    :diff => {
      "(" => [:postfix, :_diff_1],
      :HEX => [:postfix, :_diff_1],
      :O_RANGE => [:postfix, :_diff_1],
      :RANGE => [:postfix, :_diff_1],
      :STRING1 => [:postfix, :_diff_1],
      :STRING2 => [:postfix, :_diff_1],
      :SYMBOL => [:postfix, :_diff_1],
    },
    :_diff_1 => {
      "(" => [],
      ")" => [],
      "-" => [:_diff_2],
      "@pass" => [],
      "@terminals" => [],
      :HEX => [],
      :LHS => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :SYMBOL => [],
      "|" => [],
    },
    :_diff_2 => {
      "-" => ["-", :postfix],
    },
    :ebnf => {
      "@pass" => [:_ebnf_2],
      "@terminals" => [:_ebnf_2],
      :LHS => [:_ebnf_2],
    },
    :_ebnf_1 => {
      "@pass" => [:declaration],
      "@terminals" => [:declaration],
      :LHS => [:rule],
    },
    :_ebnf_2 => {
      "@pass" => [:_ebnf_1, :ebnf],
      "@terminals" => [:_ebnf_1, :ebnf],
      :LHS => [:_ebnf_1, :ebnf],
    },
    :expression => {
      "(" => [:alt],
      :HEX => [:alt],
      :O_RANGE => [:alt],
      :RANGE => [:alt],
      :STRING1 => [:alt],
      :STRING2 => [:alt],
      :SYMBOL => [:alt],
    },
    :pass => {
      "@pass" => ["@pass", :expression],
    },
    :postfix => {
      "(" => [:primary, :_postfix_1],
      :HEX => [:primary, :_postfix_1],
      :O_RANGE => [:primary, :_postfix_1],
      :RANGE => [:primary, :_postfix_1],
      :STRING1 => [:primary, :_postfix_1],
      :STRING2 => [:primary, :_postfix_1],
      :SYMBOL => [:primary, :_postfix_1],
    },
    :_postfix_1 => {
      "(" => [],
      ")" => [],
      "-" => [],
      "@pass" => [],
      "@terminals" => [],
      :HEX => [],
      :LHS => [],
      :O_RANGE => [],
      :POSTFIX => [:POSTFIX],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :SYMBOL => [],
      "|" => [],
    },
    :primary => {
      "(" => [:_primary_1],
      :HEX => [:HEX],
      :O_RANGE => [:O_RANGE],
      :RANGE => [:RANGE],
      :STRING1 => [:STRING1],
      :STRING2 => [:STRING2],
      :SYMBOL => [:SYMBOL],
    },
    :_primary_1 => {
      "(" => ["(", :expression, ")"],
    },
    :rule => {
      :LHS => [:LHS, :expression],
    },
    :seq => {
      "(" => [:diff, :_seq_1],
      :HEX => [:diff, :_seq_1],
      :O_RANGE => [:diff, :_seq_1],
      :RANGE => [:diff, :_seq_1],
      :STRING1 => [:diff, :_seq_1],
      :STRING2 => [:diff, :_seq_1],
      :SYMBOL => [:diff, :_seq_1],
    },
    :_seq_1 => {
      "(" => [:_seq_2],
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      :HEX => [:_seq_2],
      :LHS => [],
      :O_RANGE => [:_seq_2],
      :RANGE => [:_seq_2],
      :STRING1 => [:_seq_2],
      :STRING2 => [:_seq_2],
      :SYMBOL => [:_seq_2],
      "|" => [],
    },
    :_seq_2 => {
      "(" => [:diff, :_seq_1],
      :HEX => [:diff, :_seq_1],
      :O_RANGE => [:diff, :_seq_1],
      :RANGE => [:diff, :_seq_1],
      :STRING1 => [:diff, :_seq_1],
      :STRING2 => [:diff, :_seq_1],
      :SYMBOL => [:diff, :_seq_1],
    },
  }.freeze
  TERMINALS = [
    "(",
    ")",
    "-",
    "@pass",
    "@terminals",
    :HEX,
    :LHS,
    :O_RANGE,
    :POSTFIX,
    :RANGE,
    :STRING1,
    :STRING2,
    :SYMBOL,
    "|"
  ].freeze
  FIRST = {
    :alt => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_alt_1 => [
      :_eps,
      "|"],
    :_alt_2 => [
      "|"],
    :_alt_3 => [
      "|"],
    :_alt_4 => [
      :_eps,
      "|"],
    :_alt_5 => [
      :_eps,
      "|"],
    :_alt_6 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :declaration => [
      "@terminals",
      "@pass"],
    :diff => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_diff_1 => [
      :_eps,
      "-"],
    :_diff_2 => [
      "-"],
    :_diff_3 => [
      "-",
      :_eps],
    :_diff_4 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :ebnf => [
      :_eps,
      "@terminals",
      :LHS,
      "@pass"],
    :_ebnf_1 => [
      "@terminals",
      :LHS,
      "@pass"],
    :_ebnf_2 => [
      "@terminals",
      :LHS,
      "@pass"],
    :_ebnf_3 => [
      :_eps,
      "@terminals",
      :LHS,
      "@pass"],
    :_empty => [
      :_eps],
    :expression => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :pass => [
      "@pass"],
    :_pass_1 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :postfix => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_postfix_1 => [
      :POSTFIX,
      :_eps],
    :_postfix_2 => [
      :POSTFIX,
      :_eps],
    :primary => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_primary_1 => [
      "("],
    :_primary_2 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_primary_3 => [
      ")"],
    :rule => [
      :LHS],
    :_rule_1 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :seq => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_seq_1 => [
      :_eps,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_seq_2 => [
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_seq_3 => [
      :_eps,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
    :_seq_4 => [
      :_eps,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "("],
  }.freeze
  FOLLOW = {
    :alt => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_1 => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_2 => [
      "|",
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_3 => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_4 => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_5 => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_alt_6 => [
      "|",
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :declaration => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :diff => [
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_diff_1 => [
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_diff_2 => [
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_diff_3 => [
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_diff_4 => [
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :ebnf => [
      :_eof],
    :_ebnf_1 => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_ebnf_2 => [
      :_eof],
    :_ebnf_3 => [
      :_eof],
    :expression => [
      ")",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :pass => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_pass_1 => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :postfix => [
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_postfix_1 => [
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_postfix_2 => [
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :primary => [
      :POSTFIX,
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_primary_1 => [
      :POSTFIX,
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_primary_2 => [
      :POSTFIX,
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :_primary_3 => [
      :POSTFIX,
      "-",
      ")",
      "|",
      :_eof,
      :HEX,
      :SYMBOL,
      :O_RANGE,
      :RANGE,
      :STRING1,
      :STRING2,
      "@terminals",
      :LHS,
      "(",
      "@pass"],
    :rule => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_rule_1 => [
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :seq => [
      ")",
      "|",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_seq_1 => [
      ")",
      "|",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_seq_2 => [
      ")",
      "|",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_seq_3 => [
      ")",
      "|",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
    :_seq_4 => [
      ")",
      "|",
      :_eof,
      "@terminals",
      :LHS,
      "@pass"],
  }.freeze
  CLEANUP = {
    :_alt_1 => :star,
    :_alt_3 => :merge,
    :_diff_1 => :opt,
    :ebnf => :star,
    :_ebnf_2 => :merge,
    :_postfix_1 => :opt,
    :seq => :plus,
    :_seq_1 => :star,
    :_seq_2 => :merge,
  }.freeze
  PASS = [
    :PASS
  ].freeze
end

