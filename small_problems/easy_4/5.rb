=begin

Problem:
- Return the sum of values evenly divisble by 3 or 5, greater than 1 and less than the integer 
  argument.

Examples:
  5 -> (1..5) -> [3, 5] -> 8

  10 -> (1..10) -> [3, 5, 6, 9, 10] -> 33

  1000 -> (1..1000) -> [1 2 ... 1000] -> 234168

Data Structures:
- beginning: integer
- intermediate: array of integers
- ending: integer

Algorithm:
- SELECT values evenly divisible by 3 or 5
  - Create a new empty array
    - result
  - Iterate over a range between 1 and input integer
    - check if value is evenly divisible by 3 or 5
      - if yes, add to result array
      - otherwise, skip to next value
  - return result
- FIND the sum of values
  - iterate over result
    - sum the elements
- RETURN the sum

=end

def multisum(number)
  (1..number).select { |num| (num % 3 == 0) || (num % 5 == 0) }.sum
end

p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

=begin
- Further exploration:

  def multisum(number)
    values = (1..number).select { |num| (num % 3 == 0) || (num % 5 == 0) }
    values.reduce(:+)
  end

=end