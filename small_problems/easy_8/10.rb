=begin

Problem:
- Given an array of integers, return the average.
* Don't use `Array#sum`

Examples:
  average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  average([1, 5, 87, 45, 8, 8]) == 25
  average([9, 47, 23, 95, 16, 52]) == 40

Data Structures:
- beginning: array of integers
- intermediate: variable to tally sum, variable to count elements
- ending: integer

Algorithm:
- SET element_count to element count of input array
- SET sum to 0
- Iterate over input array
  - re-assign sum to sum plus current element.
- return the result of sum divided by element_count
=end

def average(input)
  element_count = input.size
  sum = 0

  input.each { |number| sum += number }
  sum / element_count.to_i
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
