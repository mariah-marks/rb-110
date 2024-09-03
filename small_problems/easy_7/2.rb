=begin

Problem:
- Given a string, return a hash.

The hash should have pair values:
  :lowercase => count of lowercase characters
  :uppercase => count of uppercase characters
  :neither => count of non-alphabetical characters
* A hash with three pairs is always returned, even if the input is an empty string.
* spaces are counted

Examples:

  ('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  ('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  ('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  ('') == { lowercase: 0, uppercase: 0, neither: 0 }

Data structures:
- beginning: string
- intermediate: 3 element hash with default values
- ending: 3 element hash

Algorithm:
- Create hash with each key assigned to zero
- convert string to array of characters, chars
- if string is empty, return hash.
- iterate over chars:
  - if value is lowercase, increment value of downcase key by 1
  - if value is uppercase, increment value of uppercase key by 1
  - otherwise, increment value of neither key by 1
- return hash
=end

def letter_case_count(characters)
  character_counts = { lowercase: 0, uppercase: 0, neither: 0 }
  chars = characters.chars

  chars.each do |char|
    if char.ord.between?(97, 122)
      character_counts[:lowercase] += 1
    elsif char.ord.between?(65, 90)
      character_counts[:uppercase] += 1
    else
      character_counts[:neither] += 1
    end
  end
  character_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
