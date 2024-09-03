=begin

Problem:
- Given a string, return a new string with each character doubled.
* every character is doubled, including spaces.

Examples:
  ('Hello') == "HHeelllloo"
  ("Good job!") == "GGoooodd  jjoobb!!"
  ('') == ''

Data Structures:
- beginning: string
- intermediate: array of characters
- ending: a new string

Algorithm:
- Create a new array of characters
- Create a new empty string called `result``
- Iterate over the array
  - Concatenate each character to result twice
- Return result
=end

def repeater(input)
  characters = input.chars
  result = ""

  characters.each do |character|
    result << character * 2
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
