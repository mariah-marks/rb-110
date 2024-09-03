=begin

Problem:
- Given an array of values, and a value, return true if the value is included
  in the array, false if the value is not included in the array.
* do not use `#include?`

Examples:
  ([1,2,3,4,5], 3) == true

  ([1,2,3,4,5], 6) == false

  ([], 3) == false

  ([nil], nil) == true

  ([], nil) == false

Data structures:
- beginning: an array and a search value
- intermediate: iterate over the input array
- ending: a boolean

Algorithm:
- Iterate over the input array
  - compare each element to search_value
  - if any element equals search_value, return true.
  - otherwise, return false.
=end

def include?(collection, search_value)
  collection.any? { |element| element == search_value }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
