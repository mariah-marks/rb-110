=begin

Given an odd integer, output a diamond made of asterisks.
* the diamond is integer asterisks wide, and integer lines long
* the number of stars on each line is always odd
* stars and spaces have an inverse relationship:
  from lines 1 - (n-1 / 2):
    - spaces decrement by 1
    - stars increment to next odd number in 1..n
  from lines (n-1 / 2) - n:
    - spaces increment by 1
    - stars decrement to next odd number in 1..n

Examples:
  1:        3:

  *          *
            ***
             *

  9:

      *
     ***
    *****
   *******
  *********
   *******
    *****
     ***
      *

  spaces 4, stars 1
  spaces 3, stars 3
  spaces 2, stars 5
  spaces 1, stars 7
  spaces 0, stars 9
  spaces 1, stars 7
  spaces 2, stars 5
  spaces 3, stars 3
  spaces 4, stars 1

Data Structures:
- input: integer representing # of rows and width of diamond

Approach:
1. output spaces and stars until star count equals input
  - reverse pattern until last line equals first line

2. create a collection with line numbers that are the same referencing the same outputs
  - 1, 9 indices: 0, -1
  - 2, 8 indices: 1, -2
  - 3, 7 indices: 2, -3
  - 4, 6 indices: 3, -4

Algorithm:
1. Assign each line to string
  - create a collection 1..input
    - an array of empty strings, with n elements
  - find middle index:
    - (n + 1 / 2) - 1
    - assign to n stars
  - for indices 0 .. -1
    - assign string
      - spaces = (n-1 / 2) stars = 1
    - decrement spaces by 1
    - increment stars by 2
  - increment starting index by 1, decrement ending by 1
2. output each string


Algorithm 2:
1. Create an array with n elements
2. Populate the array with the appropriate # of asterisks
    - For each element 1 to (n-1) / 2:
      - asterisk count is next increasing odd number (or previous plus 2)
    - For n-1 / 2 .. n
      - asterisk count is next decreasing odd number
3. Output the array

=end

def diamond(input)
  diamond = (1..input).map { |_| '' }
  middle_index = ((input + 1) / 2) - 1
  diamond[middle_index] = '*' * input
  spaces = (input - 1) / 2
  stars = 1
  positive_index = 0
  negative_index = -1

  until stars == input
    diamond[positive_index] = (' ' * spaces) + ('*' * stars)
    diamond[negative_index] = (' ' * spaces) + ('*' * stars)

    spaces -= 1
    stars += 2
    positive_index += 1
    negative_index -= 1
  end

  puts diamond
end

diamond(1)
diamond(3)
diamond(9)
