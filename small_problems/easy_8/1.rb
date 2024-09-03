=begin

Problem:
- Given an array, return the sum of every possible subsequence in the array
* Arrays contain one number at minimum

Examples:
([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
([4]) == 4
([1, 2, 3, 4, 5]) == 35

1.
  [3 5 2] -> [[3] [5 2]]
  [[3] [3 5] [3 5 2]] -> [[5] [8] [10]] -> 35
  0, sum = 0, incrementor = sum + num
  0 + 1
  0 + 1 + 2

Data Structures:
- beginning: array of integers
- ending: sum of integer combinations

Algorithm:
1. FIND the sum of all subsequences in the array
  - Initialize variables to track sum and incrementor
    - sum = 0
    - incrementor = 0
  - Iterate over input array
    - increment incrementor by num
    - increment sum by incrementor
2. RETURN the sum
  
=end

def sum_of_sums(array)
  sum = 0
  incrementor = 0

  array.each do |num|
    incrementor += num
    sum += incrementor
  end

  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
