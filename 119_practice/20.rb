# Create a method that takes an array of numbers, all of which are the same except one.
# Find and return the number in the array that differs from all the rest.

# The array will always contain at least 3 numbers, and there will always be exactly
# one number that is different.

=begin

Given an array of numbers, return the number that is unique
Rules:
- only one number will be unique, the rest will be identical
- number can be a float or an integer
* numbers are always positive

Examples:
  [0, 1, 0] => 1

  [7, 7, 7, 7.7, 7] => 7.7

Algorithm:
- Extract the repeating value, `repeating_num`
  - find the first value in which the count > 1
- Find the value that doesn't match `repeating_num`
  - iterate over the array
  - if the value doesn't match `repeating_num`
    - Return that value

Approach #2:
- find the first value in which count of num == 1
=end

# solution 1
def what_is_different(arr)
  repeating_num = arr.find { |num| arr.count(num) > 1 }
  arr.each do |num|
    return num if num != repeating_num
  end
end

# solution 2
def what_is_different(arr)
  arr.find { |num| arr.count(num) == 1 }
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3

# 9 minutes