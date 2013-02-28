# This file is automatically generated by bin/ebnf
# BRANCH derived from etc/ebnf.ebnf
module Branch
  START = :ebnf

  BRANCH = {
    :_alt_1 => {
      "(" => [],
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      "|" => [:_alt_3],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :_empty => [],
    },
    :_alt_2 => {
      "(" => [],
      "|" => ["|", :seq],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :_alt_3 => {
      "(" => [],
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      "|" => [:_alt_2, :_alt_1],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :_diff_1 => {
      "(" => [],
      "-" => [:_diff_3],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :_empty => [],
    },
    :_diff_2 => {
      "(" => [],
      "-" => ["-", :postfix],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :_diff_3 => {
      "(" => [],
      "-" => [:_diff_2, :_diff_1],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :_ebnf_1 => {
      "(" => [:declaration],
      "@pass" => [:declaration],
      "@terminals" => [:declaration],
      "[" => [:rule],
      :ENUM => [:declaration],
      :HEX => [:declaration],
      :O_ENUM => [:declaration],
      :O_RANGE => [:declaration],
      :RANGE => [:declaration],
      :STRING1 => [:declaration],
      :STRING2 => [:declaration],
    },
    :_ebnf_2 => {
      "(" => [:_ebnf_1, :ebnf],
      "@pass" => [:_ebnf_1, :ebnf],
      "@terminals" => [:_ebnf_1, :ebnf],
      "[" => [:_ebnf_1, :ebnf],
      :ENUM => [:_ebnf_1, :ebnf],
      :HEX => [:_ebnf_1, :ebnf],
      :O_ENUM => [:_ebnf_1, :ebnf],
      :O_RANGE => [:_ebnf_1, :ebnf],
      :RANGE => [:_ebnf_1, :ebnf],
      :STRING1 => [:_ebnf_1, :ebnf],
      :STRING2 => [:_ebnf_1, :ebnf],
      :_eof => [],
    },
    :_postfix_1 => {
      "(" => [],
      "-" => [],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :_empty => [],
      :_postfix_2 => [:_postfix_2],
    },
    :_primary_1 => {
      "(" => ["(", :expression, ")"],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
      :_postfix_2 => [],
    },
    :_seq_1 => {
      "(" => [:_seq_2],
      ")" => [],
      "-" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      "|" => [],
      :ENUM => [:_seq_2],
      :HEX => [:_seq_2],
      :O_ENUM => [:_seq_2],
      :O_RANGE => [:_seq_2],
      :RANGE => [:_seq_2],
      :STRING1 => [:_seq_2],
      :STRING2 => [:_seq_2],
      :_empty => [],
      :_eof => [],
    },
    :_seq_2 => {
      "(" => [:diff, :_seq_1],
      ")" => [],
      "-" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      "|" => [],
      :ENUM => [:diff, :_seq_1],
      :HEX => [:diff, :_seq_1],
      :O_ENUM => [:diff, :_seq_1],
      :O_RANGE => [:diff, :_seq_1],
      :RANGE => [:diff, :_seq_1],
      :STRING1 => [:diff, :_seq_1],
      :STRING2 => [:diff, :_seq_1],
      :_eof => [],
    },
    :alt => {
      "(" => [:seq, :_alt_1],
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      :ENUM => [:seq, :_alt_1],
      :HEX => [:seq, :_alt_1],
      :O_ENUM => [:seq, :_alt_1],
      :O_RANGE => [:seq, :_alt_1],
      :RANGE => [:seq, :_alt_1],
      :STRING1 => [:seq, :_alt_1],
      :STRING2 => [:seq, :_alt_1],
    },
    :declaration => {
      "(" => [],
      "@pass" => ["@pass"],
      "@terminals" => ["@terminals"],
      "[" => [],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :diff => {
      "(" => [:postfix, :_diff_1],
      :ENUM => [:postfix, :_diff_1],
      :HEX => [:postfix, :_diff_1],
      :O_ENUM => [:postfix, :_diff_1],
      :O_RANGE => [:postfix, :_diff_1],
      :RANGE => [:postfix, :_diff_1],
      :STRING1 => [:postfix, :_diff_1],
      :STRING2 => [:postfix, :_diff_1],
    },
    :ebnf => {
      "(" => [:_ebnf_2],
      "@pass" => [:_ebnf_2],
      "@terminals" => [:_ebnf_2],
      "[" => [:_ebnf_2],
      :ENUM => [:_ebnf_2],
      :HEX => [:_ebnf_2],
      :O_ENUM => [:_ebnf_2],
      :O_RANGE => [:_ebnf_2],
      :RANGE => [:_ebnf_2],
      :STRING1 => [:_ebnf_2],
      :STRING2 => [:_ebnf_2],
      :_empty => [],
      :_eof => [],
    },
    :expression => {
      "(" => [:alt],
      ")" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      :ENUM => [:alt],
      :HEX => [:alt],
      :O_ENUM => [:alt],
      :O_RANGE => [:alt],
      :RANGE => [:alt],
      :STRING1 => [:alt],
      :STRING2 => [:alt],
    },
    :lhs => {
      "::=" => [],
      "[" => ["[", :SYMBOL, "]", :SYMBOL],
    },
    :postfix => {
      "(" => [:primary, :_postfix_1],
      "-" => [],
      :ENUM => [:primary, :_postfix_1],
      :HEX => [:primary, :_postfix_1],
      :O_ENUM => [:primary, :_postfix_1],
      :O_RANGE => [:primary, :_postfix_1],
      :RANGE => [:primary, :_postfix_1],
      :STRING1 => [:primary, :_postfix_1],
      :STRING2 => [:primary, :_postfix_1],
    },
    :primary => {
      "(" => [:_primary_1],
      :ENUM => [:ENUM],
      :HEX => [:HEX],
      :O_ENUM => [:O_ENUM],
      :O_RANGE => [:O_RANGE],
      :RANGE => [:RANGE],
      :STRING1 => [:STRING1],
      :STRING2 => [:STRING2],
      :_postfix_2 => [],
    },
    :rule => {
      "(" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [:lhs, "::=", :expression],
      :ENUM => [],
      :HEX => [],
      :O_ENUM => [],
      :O_RANGE => [],
      :RANGE => [],
      :STRING1 => [],
      :STRING2 => [],
    },
    :seq => {
      "(" => [:diff, :_seq_1],
      ")" => [],
      "-" => [],
      "@pass" => [],
      "@terminals" => [],
      "[" => [],
      "|" => [],
      :ENUM => [:diff, :_seq_1],
      :HEX => [:diff, :_seq_1],
      :O_ENUM => [:diff, :_seq_1],
      :O_RANGE => [:diff, :_seq_1],
      :RANGE => [:diff, :_seq_1],
      :STRING1 => [:diff, :_seq_1],
      :STRING2 => [:diff, :_seq_1],
      :_eof => [],
    },
  }.freeze
  TERMINALS = [
    "(",
    ")",
    "-",
    "::=",
    "@pass",
    "@terminals",
    "[",
    "]",
    "|",
    :ENUM,
    :HEX,
    :O_ENUM,
    :O_RANGE,
    :RANGE,
    :STRING1,
    :STRING2,
    :SYMBOL,
    :_postfix_2
  ].freeze
  FIRST = {
    :_alt_1 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_2 => [
      "|"],
    :_alt_3 => [
      "|"],
    :_alt_4 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_5 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_6 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_1 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_2 => [
      "-"],
    :_diff_3 => [
      "-"],
    :_diff_4 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_5 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_6 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_1 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_2 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_3 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_empty => [
      ],
    :_lhs_1 => [
      :SYMBOL],
    :_lhs_2 => [
      "]"],
    :_lhs_3 => [
      :SYMBOL],
    :_postfix_1 => [
      :_postfix_2,
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_postfix_3 => [
      :_postfix_2,
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_primary_1 => [
      "("],
    :_primary_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_primary_3 => [
      ")"],
    :_rule_1 => [
      "::="],
    :_rule_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_1 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_3 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_4 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :alt => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :declaration => [
      "@terminals",
      "@pass",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :diff => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :ebnf => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :expression => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :lhs => [
      "["],
    :postfix => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :primary => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :rule => [
      "["],
    :seq => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
  }.freeze
  FOLLOW = {
    :_alt_1 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_2 => [
      "|"],
    :_alt_3 => [
      "|"],
    :_alt_4 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_5 => [
      "|",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_alt_6 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_1 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_2 => [
      "-"],
    :_diff_3 => [
      "-"],
    :_diff_4 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_5 => [
      "-",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_diff_6 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_1 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_2 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_ebnf_3 => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_empty => [
      ],
    :_lhs_1 => [
      :SYMBOL],
    :_lhs_2 => [
      "]"],
    :_lhs_3 => [
      :SYMBOL],
    :_postfix_1 => [
      :_postfix_2,
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_postfix_3 => [
      :_postfix_2,
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_primary_1 => [
      "("],
    :_primary_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_primary_3 => [
      ")"],
    :_rule_1 => [
      "::="],
    :_rule_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_1 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_2 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_3 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :_seq_4 => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :alt => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :declaration => [
      "@terminals",
      "@pass",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :diff => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :ebnf => [
      "@terminals",
      "@pass",
      "[",
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :expression => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :lhs => [
      "["],
    :postfix => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :primary => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
    :rule => [
      "["],
    :seq => [
      :HEX,
      :RANGE,
      :ENUM,
      :O_RANGE,
      :O_ENUM,
      :STRING1,
      :STRING2,
      "("],
  }.freeze
end

