# Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

# The array will always contain at least 2 integers.
# All values in the array must be positive (> 0).
# There may be multiple occurrences of the various numbers in the array.

=begin

Given an array of integers, return the value that can be added to the sum of digits,
so that the sum is equal to the next largest prime number

Explicit:
  - the array will always have atleast two integers
  - the numbers will always be positive
  - numbers may repeat
Implicit:
  - if the sum is prime, go to next prime number
* if n is prime, it's only factors are 1 and n

Examples:
  [1, 2, 3] => 1
  1 + 2 + 3 = 6
    nearest prime is 7
  
      6 + 1 = 7

Data Structures:
- input: array of integers
- intermediate:
  - check if number is prime
- output: integer difference from array sum and nearest prime

Algorithm:
  - find the sum of the integers, `arr_sum`
  - find the next largest prime number
    - increment number by 1 until helper method returns true for number
      Helper method: `is_prime?`
      - from 2..number - 1, for each divisor
        return false if number % divisor == 0
        otherwise return true
    - return next_prime
  - return the difference
    - next_prime - arr_sum
=end

def is_prime?(num)
  (2...num).none? { |n| num % n == 0 }
end

def nearest_prime_sum(arr)
  arr_sum = arr.sum
  num = arr_sum + 1

  num += 1 until is_prime?(num)

  num - arr_sum
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

# 19 minutes