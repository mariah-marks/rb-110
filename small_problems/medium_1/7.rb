=begin

Given a string, return a new string with numeric words converted to digits.

Examples:
'Please call me at five five five one two three four. Thanks.'
-> 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Data Structures:
- input: string of words
- intermediate:
  - an array of strings
  - a hash with number words as keys, number strings as values
- output: a new string of words, with numeric words replaced by numbers

Algorithm:
1. Create numbers hash
2. Return a new array with number words replaced with integers
  - create a new array of words
    - if word is included in hash, return value
    - otherwise return word
3. Convert array to string
4. Return string

=end

def numbers_hash
  index = 0
  %w[zero one two three four five six seven eight nine].each_with_object({}) do |word, numbers_hash|
    numbers_hash[word] = index
    index += 1
  end
end

def word_to_digit(message)
  words_array = message.split('.').map { |sentence| sentence.split(' ') }
  numbers_hash = numbers_hash()

  words_array.map do |sentence|
    sentence.map do |word|
      numbers_hash.include?(word) ? numbers_hash[word] : word
    end.join(' ').insert(-1, '.')
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
