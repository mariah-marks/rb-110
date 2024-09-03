=begin

Problem:
- Given an array of integers, return the multiplicative average of the the values rounded to 3 decimal
  places.
* a float is always returned

Examples:
  ([3, 5])                # => The result is 7.500
  ([6])                   # => The result is 6.000
  ([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

Data Structures:
- beginning: array of integers
- intermediate: variable to store the sum
- ending: float

Algorithm:
- SET a variable sum
- SET a variable count to the number of elements in the array
- Iterate over the array of integers:
  - increment sum by each variable in the array
- SET result to the result of dividing sum by count ** convert to a float before division
- Format to three decimal places
- Return result

=end

def show_multiplicative_average(integers)
  product = 1
  count = integers.size
  integers.each { |number| product *= number }
  result = product / count.to_f
  "The result is #{format('%.3f', result)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
