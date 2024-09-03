=begin

Problem
- Given a string, return a new string with the case of each character converted
  to it's opposite.
* non-alphabetical characters remain the same
* string may or may not have spaces

Examples:
('PascalCase') == 'pASCALcASE'
('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Data Structures:
- beginning: string
- intermediate: array of 
- ending: string

Algorithm
- Create a new array of characters in the string.
- Iterate over the array
  - if character is lowercase, convert to uppercase
  - if character is uppercase, convert to lowercase
- Convert the values in the array to a new string
- Return the new string

=end

def swapcase(input)
  characters = input.chars

  characters.map do |character|
    character.downcase == character ? character.upcase : character.downcase
  end.join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
