=begin

Input: an array of words
Ouput: an array for each set of words that are anagrams

* words all have the same number of characters
* words are anagrams if they have the same characters, only ordered differently.
  * some characters can occupy the same position, just not all.
Examples:
  ["demo", "dome", "mode"]
  [d e m o]
  [d o m e]
  [m o d e]

  ["neon", "none"]

Data Structures:
- beginning: array of words
- ending: nested array

*** Leave out any implementation details ***
  Requirement: avoid any premature approach from evolving
  * select, transform, sort, remove, create, count, output, find
  * serves a single purpose

  Approach: no language specifics
  * how you implement the requirement
  * more than one approach

  Procedure: clear up gaps in approach before coding
  * adds language specificity: names, implementation details, etc.

Algorithm:
- SELECT words that are anagrams
  - Compare the current word to the remaining words
    - Create an array of characters for each word
      - `chars`
    - Sort the characters for each word
      - If the sorted words are identical, go to next test
    - Compare each character in the two words arrays at each index
      - if any of the characters are different, return word2
- CREATE an array for each group of anagrams
  - Create an array of keys
    - `keys`
  - Iterate over `keys`
    - create a new subarr
      - `subarr`
    - append current key to subarr
    - Iterate over `word_list`
      - if word is an anagram, append to the current subarr

- OUTPUT each group of anagrams
  - Iterate over collection
    - Output each subarray on a new line

=end

def anagram?(word1, word2)
  word2 = word2.chars.sort.join
  word1 == word2
end

def anagrams(word_list)
  result = []
  keys = word_list.map do |word|
    word.chars.sort.join
  end.uniq

  keys.map do |key|
    subarr = []
    word_list.each do |word|
      subarr << word if anagram?(key, word)
    end

    result << subarr
  end

  result.each { |subarr| p subarr }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams(words)
