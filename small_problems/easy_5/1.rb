=begin

Given a string, return a new integer representation of the sum of each character's ASCII value.

Examples:
'Four score' -> 984

Data Structures:
- beginning: string
- intermediate: array of characters -> ascii values
- ending: integer

Algorithm:
1. TRANSFORM the characters in the array to ASCII values
- create an array of characters
  - iterate over the characters array
    - for each element, return the ASCII value as a new array element
      - map
  - return the ascii array
2. SUM the ASCII values
3. RETURN the sum

=end

# Solution 1:
def ascii_value(string)
  chars = string.chars
  count = 0

  chars.each do |char|
    count += char.ord
  end
  count
end

# Solution 2:
def ascii_value(string)
  chars = string.chars
  chars.map { |num| num.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
