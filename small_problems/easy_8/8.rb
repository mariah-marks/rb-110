=begin

Problem:
- Given a string of words, return a new string with the words in reverse order.
* if the string is empty or only contains spaces, return an empty string.
* character case is preserved.

Examples:
  ('Hello World') == 'World Hello'
  ('') == ''
  ('    ') == '' # Any number of spaces results in ''

  ('Reverse these words') == 'words these Reverse'
  [Reverse these words] -> [words these Reverse]


Data Structures:
- beginning: string with words
- intermediate: an array of words
- ending: a new string with words reversed

Algorithm:
- Create a new array of words
- Iterate over the array
  - Return a new array of values in reverse order
- Create a new string of values from the new array
=end

def reverse_sentence(input)
  words = input.split
  words.reverse.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''
