# Create a method that takes an array of integers as an argument. The method should return the
# minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements,
# the method should return nil.

=begin

input: array of integers
ouput: integer
* number output is the smallest sum of 5 consecutive integers
* return nil if there are fewer than 5 elements

examples:
  [1, 2, 3, 4, 5, -5]
    [0, 4] .. [1 2 3 4 5] = 15
    [1, 5] .. [2 3 4 5 -5] = 9

  [1, 2, 3, 4, 5, 6]
    [0, 4] ... [1 2 3 4 5]
    [1, 5] ... [2 3 4 5 6]
  
  [55, 2, 6, 5, 1, 2, 9, 3, 5, 100]
    [0..4]
    [1..5]
      ..
    [5..9]

Algorithm:
  - return nil if arr.size < 5
  - find the last starting index
    last_index = arr.size - 5
  - create a new array containing each subarray sum
    iterate from 0..last_index, for each idx
      set subarr = arr[idx, 5]
      return subarr sum as element
  - return the smallest sum

=end

def minimum_sum(arr)
  return nil if arr.size < 5
  last_index = arr.size - 5

  (0..last_index).map do |idx|
    subarr = arr[idx, 5]
    subarr.sum
  end.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# 14 mins
