=begin

Problem:
- Given a string, return a new string. If the index is even, the character should
  be uppercase. If the index is odd, the character should be lowercase.
* first letter of each string should always be capitalized
* the capitalization pattern isn't affected by non-alphabetic characters or spaces 

Examples:
  ('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  ('ALL_CAPS') == 'AlL_CaPs'
  ('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Data Structures:
- beginning: string
- intermediate: array of characters
- ending: new string

Algorithm:
- Create an array of characters from the input string (with spaces included)
- For each element in the array
  - upcase the element if the index is even
  - downcase the element if the index is odd
- Transform the array into a string
- Return the new string.

=end

def staggered_case(input)
  characters = input.chars

  characters.map.with_index do |character, index|
    index.even? ? character.upcase : character.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
