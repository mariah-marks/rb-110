=begin

Given two integers, rotate the first integer.
* the second integer determines the digit that will be rotated
* digit rotated is from the end of the collection
  - 2 corresponds to digit at index -2

Examples:
  735291, 3 -> 735912
  [7 3 5 2 9 1] -> [2] -> [7 3 6 2 9 1]

  735291, 5 -> 752913
  [7 3 5 2 9 1] -> [3] -> [752913]

Data Structures:
- beginning: integer, and value to be moved
- intermediate: array of digits
- ending: integer

Algorithm:
- Create an array of digits from the input
  - digits, reverse
- Remove the digit
  - mutliply index by -1
- Append the removed digit to the end of the array
- Convert the array to a string, and then to an integer
- Return the integer
=end

def rotate_rightmost_digits(integer, index)
  digits = integer.digits.reverse
  digits << digits.delete_at(-index)
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
