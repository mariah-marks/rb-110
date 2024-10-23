=begin

Given a number (n), return the nth value of the fibonacci sequence.
* take a procedural approach, do not use recursion.

Examples:
fib(20) -> 6765
starting values: [1, 1]

Data strucures:
- 2 element array storing last two values

Approach:
- for every element between 3..n
  - starting with an array of values: [1, 1]
  - set first value to last value
  - set second value to first_value + last value
    * When passed a block, `Enumerable#reduce` allows you to set a default variable for
      a block method variable and re-assign that variable to the block's return value on
      each iteration.

Algorithm:
- create a two-element array containing first two values
  - [1, 1]
- for every value greater than or equal to 3, up to nth value:
  - re-assign the first element to the last element
  - re-assign the last element to the sum of the first and last elements
- return the last element

=end

def fibonacci(nth)
  (3..nth).reduce([1, 1]) do |last_numbers, _|
    [last_numbers[1], last_numbers.sum]
  end.last
end

p fibonacci(20) == 6_765
p fibonacci(100) == 354_224_848_179_261_915_075
p fibonacci(100_001).to_s[-19..].to_i == 8_285_979_669_707_537_501
