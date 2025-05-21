# Create a method that takes an array of integers as an argument and returns the number of identical
# pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is
# 2: there are two occurrences each of both 2 and 1.

# If the array is empty or contains exactly one value, return 0.

# If a certain number occurs more than twice, count each complete pair once.
# For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2.
# The first array contains two complete pairs while the second has an extra 2 that isn't part of the
# other two pairs.

=begin
Given an array, return the number of identical integer pairs
* only count complete pairs
  eg. [1, 1, 1, 1] and [2, 2, 2, 2, 2] both have 2 complete pairs
* if the array is empty or contains one value, return 0


Examples:
  [3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7] .. 3
    [3, 3] [5, 5] [9, 9].. (extra 5)
    # number of occurences / 2
    increment total by result

Algorithm:
  - create a new array of sorted values, with duplicates removed
  - iterate over nums, for each num
    - count the number of times num occurs in arr
      - divide the count / 2
      - increment result
  - return result
=end

def pairs(arr)
  numbers = arr.uniq.sort
  result = 0
  numbers.each { |num| result += arr.count(num) / 2 }
  result
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

# 11.5