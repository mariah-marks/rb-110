# Create a method that takes two strings as arguments and returns true if some portion of the 
# characters in the first string can be rearranged to match the characters in the second. Otherwise,
# the method should return false.

# You may assume that both string arguments only contain lowercase alphabetic characters. Neither
# string will be empty.

=begin

Given two strings, return `true` if the first string contains the same count of all characters in the
  second string.
* both strings contain lowercase alphabetic characters
* the first string can contain characters not included in the second string

Examples:
  'phyarunstole', 'pythonrules' .. true

Data Structures:
- input: two strings
- intermediate:
  - an array of characters for str2
- output: boolean

Algorithm:
- Create an array of characters in `str2`
- Iterate over `str2_chars`, for each `char`
  - return `true` if every `char` is included in `str1`
=end

def unscramble(str1, str2)
  str2_chars = str2.chars
  str2_chars.all? do |char|
    str1.include?(char)
  end
    
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

# 9 minutes
