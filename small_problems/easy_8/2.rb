=begin

Problem:
- Given an string, return an array of all possible substring combinations.
* the array has the same number of elements as characters in the input string.
* there are no spaces in the string

Examples:
  leading_substrings('abc') == ['a', 'ab', 'abc']
  leading_substrings('a') == ['a']
  leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

  ('abc') == ['a', 'ab', 'abc']

Data Structures:
- beginning: string
- intermediate: incrementor variable
- ending: array of strings

Algorithm:
- create a new array with each character as an element
- create a new array called result
- create an incrementor variable
- iterate over the array of characters:
  - append each element to incrementor
  - append incrementor to result array
- return result

=end

def leading_substrings(input)
  characters = input.chars
  current_value = ""
  
  characters.each_with_object([]) do |char, result|
    current_value += char
    result << current_value
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']