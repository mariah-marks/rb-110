=begin

Problem:
- Given a string, return an array of substrings with each possible combination, starting with each
  value.

Examples:
  'abcde'
  [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]

  "string"[0..0] => "s"
  "string"[0..1] => "st"
  "string"[0..3] => "stri"
 
Data Structures:
- beginning: string
- intermediate: nested array containing each leading character array
- ending: array of substrings

Algorithm:
leading_substrings
1. Create an array of substrings for the leading value
  - initialize an empty array and empty string
    - result, current_character
  - create a new array of characters in input string
  - iterate over array
    - concatenate character and current_character
    - append current_character to result array
2. Return result array

substrings
1. CREATE array of leading characters
  - Iterate over characters array
    - pass input string from index to last character to leading_substrings
    - return array
  - transform nested array to one level array
    - flatten
  - Return array

=end

def leading_substrings(input)
  result = []
  current_character = ""

  input.chars.each do |character|
    current_character += character
    result << current_character
  end

  result
end

def substrings(input)
  characters = input.chars
  characters.map.with_index do |_, index|
    leading_substrings(input[index..(input.length - 1)])
  end.flatten
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
