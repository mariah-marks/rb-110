=begin

Problem:
- Given a string, return a new string with the consonants doubled
* non-alphabetical characters, including spaces, are ignored
* vowels are ignored
* case is ignored

Examples:
  double_consonants('String') == "SSttrrinngg"
  double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
  double_consonants("July 4th") == "JJullyy 4tthh"
  double_consonants('') == ""

Data Structures:
- beginning: string
- intermediate:
  - an array of characters
  - a new array with characters doubled
- ending: a new string

Algorithm:
- Create a new array of characters in the input string
- iterate over the array
  - Check if the character is alphanumeric and not a vowel
    - if so, double and return the character
    - otherwise, return the character
    - add the return value to the new array
- convert new array to a string
- return the string
=end

def double_consonants(input)
  characters = input.chars
  
  characters.map do |character|
    character =~ /[A-Za-z&&[^aeiou]]/ ? (character * 2) : character
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
