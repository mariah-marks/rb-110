=begin

Problem:
- Given a string, return a new string. If the index is even, the character should
  be uppercase. If the index is odd, the character should be lowercase.
* first letter of each string should always be capitalized
* the capitalization pattern is affected by non-alphabetic characters and spaces

Examples:
  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'

  staggered_case('ALL CAPS') == 'AlL cApS'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Data Structures:
- beginning: string
- intermediate: array of characters with spaces removed
- ending: new string

Algorithm:
- Create an array of characters from the input string
- For each character in the array
  - Upcase the first character
  - Check if the next character is non-alphabetic
    - if yes, skip to the next character
  - Check if the previous character is downcased:
    - if yes: upcase the current character
    - if no, downcase the current character
- Transform the array into a string
- Return the new string.

=end

def staggered_case(input)
  characters = input.chars
  previous_character = characters.first.upcase

  characters.map.with_index do |character, index|
    next character if character =~ /[^A-Za-z]/

    next previous_character if index.zero?

    previous_character = if previous_character.downcase == previous_character
                           character.upcase
                         else
                           character.downcase
                         end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
