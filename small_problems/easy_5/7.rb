=begin

Modify the `word_sizes`so all non-alphabetic characters are omitted from the size count.

Examples:
  'Hey diddle diddle, the cat and the fiddle!' == { 3 => 1, 4 => 1, 5 => 2 }

Data Structures:
- intermediate: new string / comparison with regex

Algorithm:
- CREATE new string with non-alphabetical characters removed
  - compare with each character with a-z
  - if included, return character
    - otherwise, return an empty string
=end

def word_sizes(words)
  lengths = words.split.map do |word|
    word = word.downcase.gsub(/[^a-z]/, "")
    word.length
  end.sort

  lengths.each_with_object({}) do |length, lengths_hash|
    occurence = lengths.count { |i| i == length }
    lengths_hash[length] = occurence
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
