# Create a method that takes an array of integers as an argument and returns an array of two numbers
# that are closest together in value. If there are multiple pairs that are equally close, return the
# pair that occurs first in the array.

=begin

Given an array of integers, return a new array containing the pair with the smallest difference
(closest in value)
* if there are more than two smallest pairs with the same difference, return the pair that occurs
first

Example:
  [5, 25, 15, 11, 20] .. [15, 11]
    [5, 25] .. 20
    [5, 15]
    [5, 11]
      [25, 15]
      [25, 11]
      [25, 20]
        [15, 11]
         ... 
        [11, 20]

  [19, 25, 32, 4, 27, 16] ... [25, 27]
    [25, 27]
  [12, 22, 7, 17]
    [12, 22], [12, 7] .. 5
      [22, 7] [22, 17] .. 5

Algorithm:
  - generate a list of pairs
    - for each idx1 in 0..2nd to last element in arr
        iterate from idx1 + 1 .. last element in arr, for each idx2
          set subarr to [idx1, idx2]
  - return the first pair with the smallest difference
    - for each pair in pairs, subtract pair[0] from pair[1], return absolute value
    - return the pair with with smallest absolute value
=end

def closest_numbers(arr)
  pairs = (0..arr.size-2).each_with_object([]) do |idx1, pairs|
    (idx1+1).upto(arr.size - 1).each do |idx2|
      pairs << [arr[idx1], arr[idx2]]
    end
  end
  pairs.min_by { |pair| pair.reduce(:-).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

# 22 mins