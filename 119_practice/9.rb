# Create a method that takes two string arguments and returns the number of times that the second
# string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1
# instance of 'bab', not 2.
# You may assume that the second argument is never an empty string.

=begin

Given two strings, return the number of times `str2` occurs in `str1`
* Rules *
* if `str2` doesn't occur in `str1`, return `0`
* strings can't overlap
  e.g. in 'babab' 'bab' occurs once.
* `str1` may be empty, but not `str2`

Examples:
  'babab', `ba` => 2
  str1[0, str2.size] == str2
  str1[str2.size]

  str[0..0] 'b' == 'ba'
  str[0..1] 'ba' == 'ba' .. count + 1
  str[1..2] 'ab' == 'ba'
  str[2..3] 'ba' == 'ba' .. count + 1
 
  'babab', 'x' => 0

  '', 'x' => 0

  'bbbaabbbbaabb', 'bbbaabb' => 1
  str1[0]

Psuedocode
  Given `str1` and `str2`
  Set `str_slice` = ''
  Set count = 0
  
  From 0..str2.size, `index`
    str[index]
    If str_slice == str2
    count += 1

    * use the sum of the length and the starting index to reset starting index of string slice
    when a match is found

Approach
- count the number of matches of str2 in str1
  - set limit = str1.size - str2.size
  - set variable starting_index = 0
  - set length = str2.length
  - from starting_index to limit, for each index
    - create a new slice of str1 characters, starting at index, length chars long
    - if slice matches str2,
      - increment count by 1
      - re-assign index to the sum of current index and length
- return count
=end

def count_substrings(str1, str2)
  limit = str1.size - str2.size
  count = 0
  starting_index = 0
  length = str2.length

  loop do
    if str1[starting_index, length] == str2
      count += 1
      starting_index += length - 1
    end

    starting_index += 1
    break if starting_index > limit
  end

  count
end

# 43 mins

# 2nd attempt
=begin

problem:
  given str1 and str2, return the number of times str1 includes str2
  * str1 may be empty, but str2 will always have atleast one character

examples:
  'babab', 'bab'
    => 1
  'babab', 'b'
    => 3

  'bbbaabbbbaab', 'baab'
    => 2
  
  data structures:
  input: str1, str2
  intermediate:
    - a substring for each possible starting index

  output: count of str2 occurrences in str1

  approach:
    1. iterate over a range, and for each idx, check if substring starting at that index equals
      str2. if it does, re-assign idx to idx + str2.size, otherwise go the the next iteration.

  algorithm:
    - given str1 and str2
    - init index = 0
    - init count = 0
    - count all possible substring matches
      - find possible substrings in str1
        - loop / iterate
          - set substr to str1[index, str2.length]
            - if substr == str2
              increment count by 1
              re-assign index to index + str2.length
            - else increment index by 1
        - break out of the loop if index > str1.size - str2.size
      - check if substr matches str2
        - increment count if true
    - return the count

=end

def count_substrings(str1, str2)
  return 0 if str2.size > str1.size

  index = 0
  count = 0

  loop do
    substr = str1[index, str2.length]
    if substr == str2
      count += 1
      index = index + str2.length
    else
      index += 1
    end

    break if index > (str1.size - str2.size)
  end

  count
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

# 19 mins