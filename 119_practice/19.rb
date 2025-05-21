# Create a method that takes an array of integers as an argument and returns the integer
# that appears an odd number of times. There will always be exactly one such integer in
# the input array.

=begin

Given an array of integers, return the return the integer that appears an odd number of times.

Examples:
  [4] => 4
  [25, 10, -6, 10, 25, 10, -6, 10, -6] => -6

Data Structures:
- beginning: array of integers
- ending: element with odd occurrence

Algorithm:
- return the element with an odd number of occurrences
  - iterate over the array `arr`
  - for each `num`,
    - count the number of values in `arr` that equal `num`
    - if the count is odd, return `num`
    - else go to next `num`

=end

def odd_fellow(arr)
  arr.each do |num|
    count = arr.count(num)
    return num if count.odd?
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0

# 7 minutes


# solution 2
def odd_fellow(arr)
  odds, evens = arr.partition { |num| arr.count(num).odd? }
  odds[0]
end
 
 
# solution 3
def odd_fellow(arr)
  arr.find { |num| arr.count(num).odd? }
end
 
p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
