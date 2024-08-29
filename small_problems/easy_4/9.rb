=begin

Problem:
- Given an integer, write a method that returns a string

Examples:
  4321 -> '4321'
  0 -> '0'

Data Structures:
- beginning: integer
- intermediate:
  - a hash with integers as keys, and strings as values
  - an array of integers -> array of strings
- ending: a string

Algorithm:
- TRANSFORM integer to array of digits
  - Create array of digits
    - #digits ** returns an array of integers in reverse order
    - reverse integer_digits array
  - Return integer_digits array
- TRANSFORM array of digits (integers) to array of strings
  - Create hash with integers 0-9 as keys and strings '0'-'9' as values
  - Iterate over integer_digits array
      - return value associated with each element from the integers hash
      - create an array of return values
        - map
  - return string_digits array
- TRANSFORM array of strings to string
  - return new string with characters from the string_digits array
    - #join
- RETURN string
=end

def integer_to_string(integer)
  integer_digits = integer.digits.reverse
  integers_hash = (0..9).zip('0'..'9').to_h
  string_digits = integer_digits.map { |key| integers_hash[key] }
  string_digits.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'