=begin

Problem:
- Given a nested array, with a string an an integer, return a new array with the
  string occurring integer times in the array.

Examples:
  [["apples", 3], ["orange", 1], ["bananas", 2]] ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data Structures:
- beginning: array with subarrays containing a string and an integer
- intermediate: 
- ending: a new array of strings

Algorithm:
- Create a new empty array, result
- Iterate over the input array
  - append subarray[0] to result subarray[1] times
- return result

=end

def buy_fruit(input)
  input.each_with_object([]) do |subarray, result|
    subarray[1].times { |_| result << subarray[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
