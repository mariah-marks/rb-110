# Create a method that takes a non-empty string as an argument. The string consists entirely of
# lowercase alphabetic characters. The method should return the length of the longest vowel substring.
# The vowels of interest are "a", "e", "i", "o", and "u".

=begin

Given a string of lowercase letters, return the longest vowel substring.
* only lowercase letters are included
* substrings include consecutive vowels only
  e.g. 'launchschoolstudents' => 2
* return 0 if no vowels are included

Examples:
  cwm -> 0
  'many' -> 1
  launchschoolstudents -> 2
  miaoued -> 5
  sequoia -> 4

Data structures:
  - intermediate:
    - array or string of vowels
    - intermediate array of vowel substrings

Algorithm:
- Create an array of vowel substrings, `vowel_substrings`
  - create a string `vowels` = `aeiou`
  - Given `string`
  - set `vowel_substrings` to string split at each non-lowercase vowel.
      - use regex
- Return the largest substring in `vowel_substrings`
  - sort the array from largest to smallest
  - return the first substring

=end

def longest_vowel_substring(string)
  return 0 if string.chars.none? { |char| 'aeiou'.include?(char) }
  vowel_substrings = string.split(/[^aeiou]/)
  vowel_substrings.max_by { |string| string.size }.size
end

# 41 minutes

# 2nd attempt
=begin

problem:
  given a string, find the longest vowel substring and return the length.
  * a vowel substring is a substring where characters are consecutive and are all vowels.

examples:
  'many'
  vowel substrings = 'a'
    'a'.length = 1
      => 1
  'launchschoolstudents'
  vowel_substrings = 'au', 'oo', 'u', 'e'
    longest_susbtr = 2
    => 2

  approach:
    1. use regex and split the string at each instance where the character is not a vowel
    2. collect all indexes where the char is a vowel. use those indexes to create substrings.
    return the size of the longest substring where all are vowels

  algorithm:
    - create an array of all vowel substrings
      - split the array where char is not a e i o  or u
      - split, regex
    - return the size of the longest substring
=end

def longest_vowel_substring(str)
  substrings = str.split(/[^aeiou]/)
  return 0 if substrings.empty?
  substrings.max_by { |substr| substr.size }.size
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

# 11 mins