=begin

Given a value (n), return the last digit of the nth number in the fibonacci sequence.

Examples:
  15 -> 0 (the 15th number is 610)
  1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
  1  2  3  4  5  6  7   8   9   10  11  12   13   14   15

Data Structures:
- intermediate array with current first and last values

Algotrithm:
- Find the last digit of the nth fibonacci number
  - Create a two element array with the initial values set to 1
  For every number between 3 and n
    - Re-assign the first element to the value of the second element
    - Set the second element to the last digit of the sum of the first and last elements
  - Return the last array element
- Return the number

Further exploration:
  If nth = 100, and the sequence of final digits repeats in cycles of 60,
  100 % 60 => evenly divides once, returns a remainder of 40.
  So for the 100th fibonacci number, we know the ending is the 40th in the sequence.

Algorithm:
For numbers with 6 digits or more:
- Create an array of last digits for the first 60 fibonacci numbers
  - Create an array with first two elements
    [1, 1]
  - for remaining elements up to 60:
    - find the last digit of the next fibonacci number
    - append the digit to the array
  - return the array
    - `last_digit_sequence`
- Use `last_digit_sequence` to find the nth fibonacci number
  - find the location of last digit in the sequence
    - the remainder of n % 60 finds the nth number in the sequence
    - return the value at index (n % 60) - 1 in the sequence
- Return the value

=end

def fibonacci_last(nth)
  return fibonacci_last_fast(nth) if nth.digits.size > 6

  (3..nth).reduce([1, 1]) do |last_numbers, _|
    [last_numbers[1], last_numbers.sum % 10]
  end.last
end

def fibonacci_last_fast(nth)
  last_digit_sequence = sequence
  last_digit_sequence[(nth % sequence.length) - 1]
end

def sequence
  (3..60).each_with_object([1, 1]) do |_, digit_pattern|
    last_digit = (digit_pattern[-2] + digit_pattern[-1]) % 10
    digit_pattern << last_digit
  end
end

p fibonacci_last(15) == 0 # (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5 # (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5 # (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001) == 1 # (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # (this is a 208989 digit number)
p fibonacci_last(123_456_789) == 4
