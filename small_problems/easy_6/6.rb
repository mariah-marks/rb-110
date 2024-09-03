=begin

Problem:
- Given two arrays, return a new array with the elements merged.
* There should be no duplicates.

Examples:
[1, 3, 5], [3, 6, 9] -> [1, 3, 5, 6, 9]

Data structures:
- beginning: two arrays
- intermediate: nested array containing input arrays
- ending: new combined array

Algorithm:
- SET new array with arr_1 as first element, and arr_2 as the second element.
- Convert nested structure to one level (flatten)
- Remove duplicate array elements
- Return new array

=end

def merge(arr_1, arr_2)
  combined_arr = [arr_1, arr_2]
  combined_arr.flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
