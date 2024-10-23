=begin

Given an integer (n), write a method that returns the nth fibonacci number.
* ie. if the input is 3, return the third number in the fibonacci sequence.
* use recursion / write a method that calls itself and uses the return value
* the first two numbers are 1, 1, with the following the sum of the current and previous in the sequence.
  1, 1, 2, 3, 5, 8, 13 ...
  1, 2, 3, 4, 5, 6, 7

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Examples:
* fib(1) -> 1
    1 < 2 => 1

* fib(3) -> 2
    f(2) + f(1)
    f(1) + f(0)       => 1
    => 1   => 0

    ((1 + 0) + (1)) = 2

Approach
- Given a number, calulcate the fibonacci number
  - If n is 0 or 1, return n
  - Else find the sum of the next two fibonacci values
    - fibonacci(nth - 1) + fibonacci(nth - 2)
      - recursive calls continue until a value which satisfies
        the base case is returned.
- Return the number

=end

def fibonacci(nth)
  return nth if nth < 2

  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
