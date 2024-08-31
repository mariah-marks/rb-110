=begin

Given an integer, return the integer as an array of individual values.

Examples:
  444 -> ["4", "4", "4"] -> [4 4 4]

Data Structures:
- beginning: integer
- intermediate: string -> array of strings
- ending: array of integers

Algorithm:
- TRANSFORM integer into array of digits
  - create new array with each number as a separate string element
  - convert the string elements to integers
- RETURN digits

=end

def digit_list(digits)
  digits.to_s.chars.map { |string| string.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true