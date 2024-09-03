=begin

Problem:
- Given an integer, return an array of integers with each number 1 to the input.

Examples:
  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]

=end

def sequence(input)
  input < 0 ? (first, last = input, 1) : (first, last = 1, input)
  first.upto(last).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1, 0, 1]
