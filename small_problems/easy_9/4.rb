=begin

Problem:
- Given a string, return an array of substrings, with the length of each word
  appended.
* words are characters separated by white space
* an array is always returned
* punctuation marks are included in the character count of each word

Examples:
  "cow sheep chicken" == ["cow 3", "sheep 5", "chicken 7"]

  "It ain't easy, is it?" == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

  "Supercalifragilisticexpialidocious" ==
    ["Supercalifragilisticexpialidocious 34"]

  "" == []

Data Structures:
- beginning: string
- intermediate: array of individual words
- ending: an array of strings

Algorithm:
- create an array of individual words
- create a variable letter_count
- iterate over words
  - assign letter_count to current word length
  - concatenate current_word with letter_count
- return a new array with each string

=end

def word_lengths(words)
  words = words.split
  letter_count = 0

  words.map do |word|
    letter_count = word.length
    word + " " + letter_count.to_s
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []