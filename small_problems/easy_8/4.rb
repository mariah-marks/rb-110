=begin

Problem:
- Given a string, return a array of substrings that are palindromes.
* non-alphabetical characters (excluding spaces) are included.
* a palindrome is always atleast two characters long.


Examples:
  palindromes('abcd') == []
  palindromes('madam') == ['madam', 'ada']
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ]
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]

Data Structures:
- beginning: string
- intermediate:
  - string to array of characters
- ending: array of palindromes

Algorithm:
1. FIND substrings that are palindromic
  - For each character combination:
    - IF character combination is the same when reversed and atleast 2 characters long
      - return to result array
    - otherwise, go to next combination
2. RETURN result array
=end

def leading_substrings(input)
  result = []
  current_characters = ""
  
  input.chars.each do |character|
    current_characters += character
    if current_characters == current_characters.reverse && current_characters.length >= 2
      result << current_characters 
    end
  end

  result
end

def palindromes(input)
  characters = input.chars

  characters.map.with_index do |_, index|
    leading_substrings(input[index..(input.length - 1)])
  end.flatten
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]