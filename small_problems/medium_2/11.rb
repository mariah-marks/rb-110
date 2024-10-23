=begin

Given a positive integer return true if it is a prime number, false if it is not.
* 1 is not a prime number
* do not use the prime class

Examples:
  1 -> false
  7 -> true
  23 -> true

Algorithm:
- Determine the even divisors
  - for every value between 2..n-1, check if n is evenly divisible by value
    - if n is evenly divisible by any value, return false
    - otherwise return true

=end

def is_prime?(num)
  return false if num == 1

  (2..num - 1).none? { |n| (num % n).zero? }
end

puts(is_prime?(1) == false)              # true
puts(is_prime?(2) == true)               # true
puts(is_prime?(3) == true)               # true
puts(is_prime?(4) == false)              # true
puts(is_prime?(5) == true)               # true
puts(is_prime?(6) == false)              # true
puts(is_prime?(7) == true)               # true
puts(is_prime?(8) == false)              # true
puts(is_prime?(9) == false)              # true
puts(is_prime?(10) == false)             # true
puts(is_prime?(23) == true)              # true
puts(is_prime?(24) == false)             # true
puts(is_prime?(997) == true)             # true
puts(is_prime?(998) == false)            # true
puts(is_prime?(3_297_061) == true)       # true
puts(is_prime?(23_297_061) == false)     # true
