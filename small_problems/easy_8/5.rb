=begin

Problem:
- Given a two numbers, print each number between the two numbers.
  For numbers divisible by 3, print "Fizz"
  Numbers divisible by "5", print "Buzz"
  numbers divisible by 15, print "FizzBuzz"

Examples:
  fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

Data Structures:
- beginning: two integers representing a range
- ending: an array of values

Algorithm:
- Create a new empty array
- Create a range between two input numbers. Iterate over the range:
  IF the number is divisble by 15, return "FizzBuzz"
  IF the number is divisible by 3, return "Fizz"
  IF the number is divisible by 5, return "Buzz"
  - Otherwise, return number
  - Append return to new array
- OUTPUT values in array
  - convert to string with `,` between each word
  - output string
=end

def fizzbuzz(number1, number2)
  # binding.pry
  result = (number1..number2).map do |number|
    if number % 15 == 0
      "FizzBuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
      "Buzz"
    else
      number
    end
  end
  puts result.join(", ")
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz