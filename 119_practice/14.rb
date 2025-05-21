# Create a method that takes a single integer argument and returns the sum of all the multiples of 7
#  or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

# For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of
# these multiples is 75.

# If the argument is negative, return 0.

=begin

Given an integer, return the sum of numbers less than integer and evenly divisible by 7 or 11.
- return 0 if the value is less than 7

Examples:
  10 -> 7

  12 .. [7, 11] -> 18
  
  -100 -> 0

Data structures:
  - intermediate:
    - array of valid numbers smaller than `input`

Algorithm:
- Create an array `numbers` with values smaller than `input`
  - return 0 if input < 7
  - for each value from (7..input)
    - if value is evenly divisible by 7 or 11
      - add to numbers
- return sum of `numbers`

=end

def seven_eleven(input)
  return 0 if input < 7
  (7...input).each_with_object([]) do |num, numbers|
    numbers << num if (num % 7 == 0 || num % 11 == 0)
  end.sum

end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

# 13 minutes
