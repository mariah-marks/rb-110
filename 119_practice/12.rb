# Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

# Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence
# "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that
# case is irrelevant.

=begin

Given a string sentence, return a boolean.
* true if the string is a pangram (each letter in the alphabet used at least once.)
Rules:
- case is ignored
- non-alphabetic characters are ignored

Example:
  'The quick, brown fox jumps over the lazy dog!'
  [t h e q u i c k b r o w n f o x j u m p s over ... d o g]
    ('a'..'z').all? chars >= 1

Data structures:
- input: string of words
- intemediate:
  - array of words
  - range of alphabetical characters
- output: boolean

Algorithm:
- Given `string`, compare the count of each character to a range of lowercase letters
  - convert the string to an array of characters
    - convert string to lowercase
    - select characters that are alphabetical
    - return array `chars`
  - create a range ('a'..'z') `letters`
  - iterate over `letters`, for each `letter`
    - return true if `characters` includes `letter` atleast once
=end

def is_pangram(string)
  letters = ('a'..'z')
  chars = string.downcase.chars.select { |char| letters.include?(char) }

  letters.all? do |letter|
    chars.include?(letter)
  end
end

# 17 minutes


# 2nd attempt
=begin

input: a string
output: a boolean
* return true if the characters in the string are a pangram
  - each letter in the alphabet occurs at least once.
* case doesn't matter

Examples:
  'The quick, brown fox jumps over the lazy dog!'
  [thequickbrownfoxjumpsoverthelazydog]

Data Structures:
  - array of lowercase letters from str
  - range of lowercase letters from a-z

Algorithm:
- Create an array of lowercased characters in the input string, `chars`
- Check to see if all alphabetical characters are included in the input string
  - create a range 'a'..'z'
  - return true if all letters in range are included in `chars`
  - otherwise return false
=end

def is_pangram(str)
  alphabet = ('a'..'z')
  chars = str.downcase.chars.select { |char| alphabet.include?(char) }
  alphabet.all? { |letter| chars.include?(letter) }
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

# 8.5 minutes