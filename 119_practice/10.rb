# Create a method that takes a string of digits as an argument and returns the number of even-numbered
# substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are
# '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

# If a substring occurs more than once, you should count each occurrence as a separate substring.

=begin

Given a string of numbers, return a count of even numbered substrings that can be formed.
* rules:
- order of the substrings is preserved
- if a substring occurs more than once, count each occurrence separately.
  e.g '143232' -> '32' is counted twice
- return 0 if no substrings are even

example:
  1432
  [14, 1432, 4, 432, 32, 2] .. 6

Data structures:
- intermediate array with even number combinations

Algorithm:
- create an array of `even_substrings`
  - intialize an empty array `even_substrings`
  - use nested iteration to create substrings starting with each character in the array
    - from 0 .. string.size -1, for each `starting_index`
      - index...string.size - 1, `ending_index`
        - set `substring` to string[starting_index..ending_index]
        - if the substring is even when converted to an integer
          - add it to `even_substrings`
- return the number of elements in even substrings

=end

def even_substrings(str)
  even_substrings = []
  limit = str.size - 1
  
  (0..limit).each_with_object([]) do |starting_index, even_substrings|
    starting_index.upto(limit) do |ending_index|
      substring = str[starting_index..ending_index]
      even_substrings << substring if substring.to_i.even?
    end
  end.size
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

# 17 minutes


# 2nd attempt
=begin
  problem:
    given a string, find all substring permutations where the digits are: consecutive and even,
    when converted to an integer

  examples:
    '1432' 
    [1 14 143 1432]
      [14, 1432]
    [4 43 432]
      [4, 432]
    [3 32]
      [32]
    [2]
      [2]
    => 6

  data structures:
    - array containing all possible consecutive digits (if also even)

  approach:
    - find all even numbered consecutive digits, as strings. if the string is even when converted
    to an integer, add it to an array `substrings`. return the count of substrings.

  algorithm:
    - find all substrings
      - init substrings to empty array
      iterate over a range, 0 to str size (exclusive), for each starting_idx
        iterate over a range `starting_idx` to str size (exclusive), for each `remaining_idx`
          set substr to string slice from starting_idx to remaining_idx
          convert substr to an integer and check if it's even
            - if true, add to substrings arr
    - return the count of substrings

=end

def even_substrings(str)
  substrings = []
  (0...str.size).each do |starting_idx|
    (starting_idx...str.size).each do |remaining_idx|
      substr = str[starting_idx..remaining_idx]
      substrings << substr if substr.to_i.even?
    end
  end
  
  substrings.size
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

# 12 mins