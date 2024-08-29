=begin

Problem:
- Given a string, return an integer.

Examples:
  '4321' -> [4 3 2 1]
  [0] 4000 -> (4 * 10 ^ 3)
  [1] 300 -> (3 * 10 ^ 2)
  [2] 20 -> (2 * 10 ^ 1)
  [3] 1 -> (1 * 10 ^ 0)

Data Structures:
- beginning: string
- intermediate:
  - array of string digits -> array of integers
  - string to integer hash
- ending: integer

Algorithm:
1. TRANSFORM individual string characters to an array of integers
  - Create a hash with strings '0'..'9' as keys and 0-9 as values
    - digits
  - Create a new array with each number as a string element
    - characters
  - Iterate over characters
    - retrieve hash value for the given string character
    - return value as element in new array
      - integers
2. RETURN the values in the array as an integer
  - Reverse integers
  - Iterate over integers
    - multiply the current value by 10 ** value at index
  - Sum the values in integers
  - RETURN sum
=end

def string_to_integer(string)
  digits = ('0'..'9').zip(0..9).to_h

  integers = string.chars.map { |number| digits.fetch(number) }.reverse

  integers.map.with_index do |number, index|
    number * (10**index)
  end.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

=begin
Further exploration:
- Write a method that converts a hexadecimal number to an integer.

Rules:
- 0-9 represent values 0-9, and a-f represent 10 to 15
- hexadecimal numbers are base 16

Examples:
  '4D9F'
  [0] 4 -> (4 * 16 ^ 3)
  [1] 'D' -> 13 -> (13 * 16 ^ 2)
  [2] 9 -> (9 * 16 ^ 1)
  [3] 'f' -> 15 -> (15 * 16 ^ 0)

Data Structures:
- beginning: string
- intermediate:
  - array of string digits -> array of integers
  - string to integer hash
- ending: integer

# Algorithm:

1. TRANSFORM individual string characters to an array of integers
  - Update digits hash to include keys 'a'-'f' with values 10 - 15
  - Create a new array with each number as a string element
    - characters
  - Iterate over characters
    - retrieve hash value for the given string character
    - return value as element in new array
      - integers
2. RETURN the values in the array as an integer
  - Reverse integers
  - Iterate over integers
    - multiply the current value by 16 ** value at index
  - Sum the values in integers
  - RETURN sum
=end

def hexadecimal_to_integer(string)
  keys = ('0'..'9').to_a + ('a'..'f').to_a
  digits = keys.zip(0..15).to_h

  integers = string.downcase.chars.map { |number| digits.fetch(number) }.reverse

  integers.map.with_index do |number, index|
    number * (16**index)
  end.sum
end

p hexadecimal_to_integer('4D9f') == 19871
