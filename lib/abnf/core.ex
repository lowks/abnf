defmodule(Abnf.Core) do
  import(Abnf.Operators, warn: false)
  def(parse(rule, input) when is_binary(input)) do
    parse(rule, String.to_char_list(input))
  end
  def(parse(rule, input)) do
    parse(rule).(input)
  end
  defrule(:ALPHA) do
    alternate([range(65, 90), range(97, 122)])
  end
  defrule(:BIT) do
    alternate([literal('0'), literal('1')])
  end
  defrule(:CHAR) do
    range(1, 127)
  end
  defrule(:CR) do
    literal('\r')
  end
  defrule(:CRLF) do
    concatenate([parse(:CR), parse(:LF)])
  end
  defrule(:CTL) do
    alternate([range(0, 31), literal([127])])
  end
  defrule(:DIGIT) do
    range(48, 57)
  end
  defrule(:DQUOTE) do
    literal('"')
  end
  defrule(:HEXDIG) do
    alternate([parse(:DIGIT), literal('A'), literal('B'), literal('C'), literal('D'), literal('E'), literal('F')])
  end
  defrule(:HTAB) do
    literal('\t')
  end
  defrule(:LF) do
    literal('\n')
  end
  defrule(:LWSP) do
    repeat(0, :infinity, alternate([parse(:WSP), concatenate([parse(:CRLF), parse(:WSP)])]))
  end
  defrule(:OCTET) do
    range(0, 255)
  end
  defrule(:SP) do
    literal(' ')
  end
  defrule(:VCHAR) do
    range(33, 126)
  end
  defrule(:WSP) do
    alternate([parse(:SP), parse(:HTAB)])
  end
  nil
end