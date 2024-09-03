=begin

- Given an array, return a new array. The first argument should be a nested array with
  the first 2-3 elements in the input array. The second element should be a nested
  array with the last 2 elements in the array. 
* an array with one element should return the same nested array structure, with the
  second element being an empty nested array.

Examples:
  [1, 2, 3, 4] == [[1, 2], [3, 4]]
  length = 4 / 2
  [0..2], index < 2
* If the array has an even number of elements, the first nested array contains values
  from indices 0..length/2.

  [1, 2, 3, 4, 1] == [[1, 2, 3], [4, 1]]
  length = (5 / 2) + 1
  [0..3], index < 3
* If the array has an odd number of elements, the first nested array contains values
  from indices 0..((length/2) + 1).

Data Structures:
- beginning: array
- intermediate: use *partition*
- ending: two element nested array

Algorithm:
- For each element in input array:
  - if the element count is even:
    - SET the first subarray, with elements at indices 0..length/2.
    - SET the second subarray to elements at remaining indices
  - if the element count is odd:
    - SET the first subarray with indices 0..((length/2) + 1)
    - SET the second subarray to elements at remaining indices
- return a new two-element array containing first and second subarrays.
=end

def halvsies(array)
  if array.size.even?
    array.partition.with_index { |num, index| index < (array.size / 2) }
  else
    array.partition.with_index { |num, index| index < ((array.size / 2) + 1) }
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halvsies([5]) == [[5], []] # true
p halvsies([]) == [[], []] # true
