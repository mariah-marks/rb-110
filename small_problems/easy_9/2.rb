=begin

Problem:
- Given an integer, return each integer doubled unless it is double number.
* a double number has an even number of digits, with the same digit order on the
  right and left side.
* for non-doubles, the whole integer is doubled.

Examples:
  107 * 2 -> 214

  444 * 2 -> 888

  103103 -> [103] == [103] -> 103103
  
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789

Data Structures:
- beginning: integer
- intermediate: an array of integers to check if number is doubled
- ending: original or new integer

Algorithm:
- check if number is doubled and even
  - to check if number is doubled, compare each digit in the first half of the
    number to each digit in the second half
  - if yes, return number
- otherwise, multiply number by 2 and return result
=end

def twice(number)
  digits = number.digits.reverse

  right, left = digits.partition.with_index { |digit, index| index < digits.count / 2 }
  return number if right == left
  number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
