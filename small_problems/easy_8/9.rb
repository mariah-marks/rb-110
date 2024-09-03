=begin

Problem:
- Given a string of words, return a new string with with words longer than 4
  letters reversed.
* word order is maintained, but character order within the words is altered.
* words with 4 characters or fewer aren't reversed.

Examples:
  reverse_words('Professional')          # => lanoisseforP
  reverse_words('Walk around the block') # => Walk dnuora the kcolb
  reverse_words('Launch School')         # => hcnuaL loohcS

Data Structures:
- beginning: string
- intermediate: array of words
- ending: string of words

Algorithm:
- create an array of words
- iterate over the words array and return a new array of values:
  - if the word is 4 characters long, return the word
  - if the word is greater than 4 characters long, return the word reversed
- return a new string of values from the array

=end

def reverse_words(input)
  words = input.split
  words.map { |word| word.size < 5 ? word : word.reverse }.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
