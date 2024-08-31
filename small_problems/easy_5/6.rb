=begin

Problem
- Given a string of one or more words (separated by spaces), return a new hash.
  For each pair, the key represents the number of characters in the word, while the value represents the number
  of words which have that length. The hash will be ordered from smallest to largest key.

Rules:
- punctuation marks are counted, but spaces are not.

Examples:

  [Four score and seven.] -> [4 5 3 6]
  [4 5 2 6] -> {4=>1, 5=>1, 3=>1, 6=>1} 
  {3=>1, 4=>1, 5=>1, 6=>1}

  [Hey diddle diddle, the cat and the fiddle!] -> [3 6 7 3 3 3 3 7]
  [3 6 7 3 3 3 3 7] -> {3=>5, 6=>1, 7=>2}

  [''] -> {''}
  {}

Data Structures
- beginning: string
- intermediate: array of strings -> array of integers
- ending: hash with integers as keys and values

Algorithm
1. create new string with each word as an element
2. iterate over new array (using map). For each word:
  - count the number of characters in the word
  - return the count as an integer
  - add return value to new array
3. sort the array of integers from smallest to largest.
4. transform the array to a hash
  - for each value
    - set the length as the key, an the number of occurences as the value.
5. Return the hash
=end

def word_sizes(words)
  lengths = words.split.map do |word|
    word.length
  end.sort

  lengths.each_with_object({}) do |length, lengths_hash|
    occurrence = lengths.count { |i| i == length }
    lengths_hash[length] = occurrence
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
