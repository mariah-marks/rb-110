=begin
Given a string, return a string with the first and last characters of each word swapped.
* words are delimited by spaces
* character case is preserved

Examples:
  'Oh what a wonderful day it is' -> 'hO thaw a londerfuw yad ti si'
  [Oh what a wonderful day it is] -> [hO thaw a londerfuw yad ti si]
  -> 'hO thaw a londerfuw yad ti si'

Data Structures:
- beginning: string
- intermediate: array of substrings
- ending: string

Algorithm:
- CREATE a collection of words
  - Initialize a new array of words
    - #split
- TRANSFORM words so first and last characters are replaced
  - Iterate over the words array
    - swap the first and last characters
  - return the word to a new array
- TRANSFORM array to string
  - Return new string with each element separated by a space
    - #join
- RETURN string
=end

def swap(sentence)
  sentence.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'