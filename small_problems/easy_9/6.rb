=begin

Problem:
- Given two integers, return an array of integers
* the second integer argument is the starting value
* the first integer argument is the element count
* the starting integer can be positive or negative

Examples:
  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []

Data Structures:
- beginning: two integers
- ending: an array of integers

Algorithm:
- Create a new array starting with the arg2
  - increment the value of arg2 by 1 and append the value until the array has
    arg1 elements.
- RETURN new array

=end

def sequence(count, starting_value)
  1.upto(count).map do |num|
    starting_value * num
  end
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
