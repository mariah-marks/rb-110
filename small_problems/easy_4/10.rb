=begin

Problem:
- convert signed integer to string
* return value is always signed, unless the input is 0.

Examples:
4321 -> '+4321'
-123 -> '-123'
0 -> '0'

Data structures:
  integer -> string

Algorithm:
- IF integer is > 0,
  - append '+' to result
  ELSE integer < 0
  - convert integer to absolute value, before passing to helper method
    - #abs
  - append '-' to result
- RETURN result
=end

def integer_to_string(integer)
  integer_digits = integer.digits.reverse
  integers_hash = (0..9).zip('0'..'9').to_h
  string_digits = integer_digits.map { |key| integers_hash[key] }
  string_digits.join
end

def signed_integer_to_string(integer)
  return "+ #{integer_to_string(integer)}" if integer.positive?

  return "- #{integer_to_string(integer.abs)}" if integer.negative?

  integer_to_string(integer)
end

=begin
Further Exploration:
- refactor signed_integer_to_string so that integer_to_string is only invoked once.
=end

# def signed_integer_to_string(integer)
#   sign = case integer <=> 0
#          when -1 then '-'
#          when 1 then '+'
#          else ''
#          end

#   "#{sign}#{integer_to_string(integer.abs)}"
# end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
