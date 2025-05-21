# Create a method that returns the count of distinct case-insensitive alphabetic
# characters and numeric digits that occur more than once in the input string.
# You may assume that the input string contains only alphanumeric characters.

=begin

Given an input string of letters and numbers, return the count of numbers that occur more than once.
input: a string of letters and numbers
output: a count of letters and numbers that occur more than once
* characer case is ignored
* return 0 if no values occur more than once

Example:
  'xxyypzzr' -> 3
  x, y, z

  '7657' -> 1
  7

  '2718281828459045'

Data Structures:
  - intermediate array duplicates removed
Algorithm:
- Given an input string `str`, convert characters to lowercase
- Initialize a `count` variable = 0
- Initialize a array `uniq_chars` with duplicates removed
- iterate over the characters in `uniq_chars`, for each `char`
  - if `char` count in `str` >= 2, increment `count` by 1
- return `count`

=end

def distinct_multiples(str)
  count = 0
  str = str.downcase
  uniq_chars = str.chars.uniq

  uniq_chars.each do |char|
    count += 1 if str.count(char) >= 2
  end

  count
end

p distinct_multiples('xyz') == 0               # none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

# 14 mins
