=begin

* Problem:
Given a number (representing the # of digits), return the index of the first number in the
fibonacci sequence with that many digits.

* Examples:
  n = 2 (first whole number > 10^(n-1)) -> 7
  [1 1 2 3 5 8 13]
  If the input is 2, the index 7 is returned because the first 2 digit number (13) occurs 
  at the 7th index.

  n = 3 (first whole number > 10^(n-1)) -> 12
  [1 1 2 3 5 8 13 21 34 55 89 144]
  If the input is 3, the index 12 is returned because the first 3 digit number (144) occurs at
  index 12.

* Data Structures:
- beginning: integer
- intermediate: array of two relevant fibonacci numbers
- ending: integer

* Algorithm:
Given a length,
1. FIND fibonacci numbers
  - initialize a limit variable
    - 10 ^ length-1
  - create an array of first and last fibonacci numbers
    - [1, 1]
  - initialize an index variable
    - starting at 2
  LOOP until second fibonacci value > or = limit
    - set current value = sum of two values in fib array
    - replace values in fibonacci
      - second number becomes first value
      - second value becomes sum of two values (before re-assignment)
    - increment index by 1
2. RETURN index

=end

def find_fibonacci_index_by_length(length)
  limit = 10**(length - 1)
  fibonacci = [1, 1]
  index = 2

  while fibonacci.last < limit
    fibonacci.replace([fibonacci.last, fibonacci.sum])
    index = index.succ
  end
  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
