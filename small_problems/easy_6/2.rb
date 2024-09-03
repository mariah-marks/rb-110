=begin

Problem:
- Given an array of strings elements, return the same array with vowels removed from each
  string.
- vowel removal is case insensitive
- the same number of elements are always returned, even if it's an empty string
- character case isn't altered

Examples:
  [green YELLOW black white] -> [grn YLLW blck wht]
  [g r e e n] -> [g r n] -> "grn"
  [Y E L L O W] -> [Y L L W] -> "YLLW"

  ABC AEIOU XYZ -> 'BC', '', 'XYZ'
  [1 2 3] -> [1 2 3]

Data structures:
- beginning: array of strings
- intermediate: array of characters in each string
- ending: array of strings

Algorithm:
- TRANSFORM array to a new array without vowels
  - iterate over input array
    - for each string, create a new array of characters
      - iterate over array of characters,
        - if character is a vowel, remove from string
      - convert characters array to string
    - return string
- RETURN new array

=end

def remove_vowels(strings_array)
  strings_array.map do |string|
    string.chars.select { |char| char.downcase =~ /[^aeiou]/ }.join
  end 
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
