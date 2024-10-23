=begin

Given an integer:
- for every value up to integer, calculate difference of the sum of integers squared
  from the the sum of the squares.

Examples:
  3 -> 22
  (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

Algorithm:
- calculate the sum of integers squared
  - from 1..n, sum each value and square the final result
  - set return value to sum_squared
- calculate the sum of squares for each integer
  - from 1..n, square each value find the the sum
  - set return value to sum_of_squares
- calulate the difference
  - subtract sum_of_squares from sum_squared
- return the result

=end

def sum_square_difference(num)
  sum_squared = (1..num).reduce(:+)**2
  sum_of_squares = (1..num).reduce { |sum, n| sum + n**2 }
  sum_squared - sum_of_squares
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2_640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25_164_150
