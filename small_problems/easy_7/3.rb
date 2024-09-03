=begin

Problem:
- Given a string, return a new string. For each word, the first letter should
  be uppercased and the remaining letters lowercased.
* the case of characters between double quotes don't change.
* words are delimited by whitespace.

Examples:
('four score and seven') == 'Four Score And Seven'
('the javaScript language') == 'The Javascript Language'
('this is a "quoted" word') == 'This Is A "quoted" Word'

Data Structures:
- beginning: string
- intermediate: array of individual words
- ending: a new string

Algorithm:
- Create array of words
- For each word in words array:
  - capitalize the first character
  - downcase the remaining characters
  - add word to new array.
- Convert words array to a string with a space between each word.
- Return the string


=end
 
def word_cap(sentence)
  words = sentence.split

  words.map do |word|
    word.capitalize
  end.join(" ")
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

*** Further Exploration ***
  Recreate the method without `#capitalize`.

  - Add an additional layer of iteration, within `map` method block, that iterates
    over an array of characters for that word.
    - For each word, capitalize the letter at the first index
    - downcase the letter at the remaining indices
    - convert the array of characters to a string
    - return the string.

=end

def word_cap_2(sentence)
  words = sentence.split

  words.map do |word|
    characters = word.chars

    characters.map.with_index do |character, index|
      index == 0 ? character.upcase : character.downcase
    end.join
  end.join(" ")
end

p word_cap_2('four score and seven') == 'Four Score And Seven'
p word_cap_2('the javaScript language') == 'The Javascript Language'
p word_cap_2('this is a "quoted" word') == 'This Is A "quoted" Word'
