=begin

Problem:
- Given a string of words, return the word before last.
* words are characters separated by white space
* examples contain 2 words at minimum

Examples:
  ('last word') == 'last'
  ('Launch School is great!') == 'is'

Data Structures:
- beginning: string of words
- intermediate: array of words (strings)
- ending: next to last string

Algorithm:
- create a new array of words
- iterate over the array
- return the next to last word in the array

=end

def penultimate(sentence)
  words = sentence.split
  words[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'


=begin

Further Exploration:

Problem:
- Given a string of words, find the middle word.

Edge cases:
- Return value when the string:
  - has an even number of words => array with middle two words
  - has no spaces / one word => word
  - is empty => empty string
  - has consecutive spaces

Examples:
  'Launch School is so great!' -> 'is'
  'Launch School is great!' -> ['School', 'is']
  'last' -> 'last'
  '' -> ''
  '    ' -> ''
  '  Launch  School   is     great!' -> ['School', 'is']

Data structures:
- beginning: string of words
- intermediate:
- ending: array of middle words or word

Algorithm:
- if string is empty, return string
- convert words to an array of strings
- set count to number of array elements
- if array has an odd number of elements, return element at index count / 2
- if array has even number of elements, return array of elements at indices count / 2, count / 2 - 1

=end

def penultimate_2(sentence)
  words = sentence.split
  return '' if words.empty?
  count = words.size

  return words[(count / 2)] if count.odd?
  words.values_at((count / 2 - 1), (count / 2))
end

p penultimate_2('Launch School is so great!') == 'is'
p penultimate_2('Launch School is great!') == ['School', 'is']
p penultimate_2('last word') == ['last', 'word']
p penultimate_2('') == ''
p penultimate_2("  Launch  School   is     great!") == ['School', 'is']
p penultimate_2("    ") == ''
