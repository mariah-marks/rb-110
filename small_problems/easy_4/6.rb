=begin

Given an array, transform the array to a new array
* In the new array, the each value is the sum of the current value and previous value from the
  original array.

Rules:
- input and output arrays have the same number of elements
- The first number is always the same

Examples:
  [0, 1, 2] --> [0, 1, 3]
  [1, 2, 3] --> [1, 3, 6]

  [2, 5, 13] --> [2, 7, 20]
  [14, 11, 7, 15, 20] --> [14, 25, 32, 47, 67]
  [3] --> [3]
  [] --> []

Data structure:
- beginning: array of integers
- ending: array of integers 

Algorithm:

1. Create an empty array `new_array`
- if the array is empty, return `new_array`
2. Iterate over the original array, `array`
  - assign first element in the `array` as the first element in the `new_array`
  - For each subsequent array element:
    - assign the current element in `new_array` to the sum of the current and previous
    index of the original.
3. return the new array.

=end

def running_total(array)
  new_array = []
  return new_array if array.empty?
  new_array << array.first

  array.each_with_index do |num, idx| # 1
    next if array.first == num
    running_total = array.take(idx + 1).sum
    new_array << running_total
  end

  new_array
end

# Further Exploration:

# 1
def running_total(array)
  running_total = 0

  array.each_with_object([]) do |number, new_array|
    running_total += number
    new_array << running_total
  end
end

# 2
def running_total(array) # [2, 5, 13]
  running_total = 0
  array.reduce([]) do |new_array, number|
    running_total += number
    new_array << running_total
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
