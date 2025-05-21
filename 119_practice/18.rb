# Create a method that takes an array of integers as an argument. Determine
# and return the index N for which all numbers with an index less than N sum
# to the same value as the numbers with an index greater than N. If there is
# no index that would make this happen, return -1.

# If you are given an array with multiple answers, return the index with the
# smallest value.

# The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the
# numbers to the right of the last element is 0.


=begin

Given an array of numbers, return the smallest index where the values to the
  left of that index are equal to the values to the right of that index.
- Return -1 if condition isn't met
* If there are two indices that meet the condition, return the smaller index

Example:
  [1, 2, 4, 4, 2, 3, 2] => 3
  left_sum = [0...3] ... [1 2 4] = 7
  right_sum = [4..-1] ... [2 3 2] = 7

  [7, 99, 51, -48, 0, 4]
  n = 0
  left_sum = 0, right_sum[0...-1].sum

  n = 1
  left_sum = [0..0], right_sum[1...-1].sum

  n = 2
  left_sum = [0..1], right_sum[2...-1].sum


Data structures:
- beginning: an array of integers
- intermediate:
  - subarray for values to left and right of current index (for each element in `arr`)
- ending: index where values to either side are equal

Algorithm:
- given an array `arr`
- Create 2 new left and right subarrays for each `index` in `arr`
  on first iteration, let left_sum = 0
    right_sum[index..-1]
  return index if left_sum == right_sum
  set left_sum = arr[0..index-1]
- return -1

=end

def equal_sum_index(arr)
  arr.each_index do |index|
    right_sum = arr[(index + 1)..-1].sum
    left_sum = arr[0...index].sum

    return index if left_sum == right_sum
  end
  -1
end

# 40 mins

# 2nd attempt:
=begin

problem:
  - given an array, return the index where the values to the left sum to
    the values to the right.

examples:
  [17, 20, 5, -60, 10, 25] -> 0
  idx 0, idx 0 is omitted

  values from 0 to idx (exclusive)
  0...idx, left_values = []
  
  values from idx+1 to arr.size - 1 (inclusive)
  idx+1..last_idx, right_values = [20, 5, -60, 10, 25]

data structures:
  - subarray for each left and right side

approach
  1. iterate over input array, for each index, set left subarr and right subarray.
  if the sum of left equals the sum of right, return the current index. if iteration
    completes without returning an index, return -1.

algorithm:
  - compare each subarray sum in arr
    - iterate over arr, for each index:
      set left_subarr = arr[0...index]
      set right_subarr = arr[index + 1...arr.size]
    - check if the sum of left_subarr = sum of right_subarr
      - if true, return index
  - if nothing returned, return -1

=end

def equal_sum_index(arr)
  arr.each_with_index do |_, idx|
    left_subarr = arr[0...idx]
    right_subarr = arr[(idx+1)...arr.size]
    return idx if left_subarr.sum == right_subarr.sum
  end

  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

# 14 minutes