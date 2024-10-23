=begin

Given a number, return the next number in the sequence that meets the following criteria:
  - odd
  - a multiple of 7
  - doesn't have any duplicate digits
    - e.g. 133 is not valid
  * this means that the largest possible number is 9_876_543_210

Examples:
  12 -> 21
    12 + 1
    -> (13 % 7) = 0 ? => false
    13 + 1
    -> (14 % 7) = 0 ? (14 % 7) odd? => false
    ...
    20 + 1
    21 % 7 = 0 ? odd ? => true
    21 no duplicates ? => true
    => 21

Data structures:
- intermediate array of digits, to count duplicates

Algorithm:
- Find the next featured number
  Given a number:
  - increment number by 1 until:
    - number is odd
    - number is divisible by 7
- Check if the number has duplicate digits
  - if no, return number
  - if number exceeds maximum value, return error
  - Otherwise, set number to next odd multiple of 7 until there are no duplicate digits.
- Return the number

=end

def unique_digits?(number)
  characters_array = number.to_s.chars
  characters_array.uniq.join.to_i == number
end

def featured(number)
  number = number.next
  number += 1 until number.odd? && (number % 7).zero?

  until unique_digits?(number)
    number += 14
    return 'There is no possible number that fulfills those requirements' if number >= 9_876_543_210
  end

  number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> 'There is no possible number that fulfills those requirements'
