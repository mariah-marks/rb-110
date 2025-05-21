# Create a method that takes an array of numbers as an argument. For each number,
# determine how many numbers in the array are smaller than it, and place the answer
# in an array. Return the resulting array.

# When counting numbers, only count unique values. That is, if a number occurs
# multiple times in the array, it should only be counted once.

=begin

input: array of integers
output: new array of integers
* the returned array contains the count of values smaller than the current value
* a new array contains the same number of elements as the argument
* when determining each count, values are only counted once

Example:
  [8, 1, 2, 2, 3]  ...
    3 elements < 8, (1, 2, 3) * 2 only counted once
      0 elemnts < 1 
        1 element < 2 (1)
          1 element < 2 (1)
            2 elements < 3 (1, 2)

Algorithm:
  - create a new array with duplicates removed `unique_nums`
    - sort in ascending order
  - create a new array, for each element `num`
    - return the index of that value in `unique_nums`
  - return new array
=end

def smaller_numbers_than_current(arr)
  unique_nums = arr.uniq.sort
  arr.map { |num| unique_nums.index(num) }
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

# 10 mins
