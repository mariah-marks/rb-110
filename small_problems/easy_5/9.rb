require 'pry-byebug'

=begin

Given a string, return a new string with duplicate characters removed. Duplicate characters are specified as
any character that occurs more than once consecutively.

Example:
'444abcabccba' -> '4abcabcba'



Data Structures:
- beginning: string
- ending: new string

Algorithm:
1. TRANSFORM string to array of strings
  - initalize array with string element for each word
    - split
2. TRANSFORM strings so duplicates are removed
  - Iterate over words array
    - compare each character to the next character in the string
    - if the two characters are different, append letter to new string
3. RETURN string

=end

def crunch(words)
  result = ""

  0.upto(words.size - 1) do |index|
  result << words[index] if words[index] != words[index + 1]
  end

  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
