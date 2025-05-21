# Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

=begin

input: a string
output: a string with the character that occurs most
* if more than one character occurs at the greatest frequency, return the character that occurs first.
  e.g. 'Mississippi' -> 'i'
* case is ignored
* a lowercase character is always returned

Are spaces considered characters?

Examples:
  'Hello World' .. 'l'
  Happy birthday! .. 'h'

Algorithm:
- Create an array of characters
  - convert all letters to lowercase
  - initialize a new array of characters `letter_chars`
- Count the number of occurrences for each character
  - intialize a counter variable = 0, `count`
  - initialize a variable `frequent_char` = ''
  - iterate over the `letter_chars`, for each `char`
    - count the number of remaining elements in `letter_chars` that match `char`, `letter_count`
    - IF the count is greater than `count`, set `count` to `letter_count`
    - Set `frequent_char` to `char`
- Return the first character with the highest number of occurrences
  - return `char`
=end

def most_common_char(string)
  letter_chars = string.downcase.chars
  count = 0
  frequent_char = ''

  letter_chars.each do |char|
    current_count = letter_chars.count(char)
    if current_count > count
      count = letter_chars.count(char)
      frequent_char = char
    end
  end
  frequent_char
end

# 25 mins

# 2nd attempt
=begin

given a string, return the character with the greatest number of occurences / highest frequency
* ignore case of characters
* return the first character to have the highest number of occurences

Examples:
  'Hello World' .. 'l'
  [h e l l o   w o r l d]
    count the number of times that letter occurs in input string
      - mind the case
  'Mississippi' .. 'i'
  'i' count = 4
  's' count = 4

Algorithm:
  - create an array of characters downcased
  - return the value with the largest character count
=end

def most_common_char(str)
  chars = str.downcase.chars
  chars.max_by { |char| str.downcase.count(char) }
end


p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

# 9 mins
