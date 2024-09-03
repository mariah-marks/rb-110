=begin

Problem:
- Given an integer, return the sum of the digits.
* Underscores are ignored

Examples:
  23 -> 2 + 3 -> 5
  496 -> 4 + 9 + 6 -> 19
  123_456_789 -> 1 + 2 + 3 ... + 9 = 45

Data structures:
- beginning: integer

- ending: integer sum of digits

Algorithm:
- SELECT digits
  - Create a new array of digits
    - `digits`
    - convert integer to a string
    - convert string to an array of string digits
    - convert string digits to integer digits
- FIND sum of digits
  - initialize sum
    - `sum = 0`
  - sum each digit in `digits`
- RETURN sum

=end

def sum(number)
  number.to_s.chars.map! { |digit| digit.to_i }.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
