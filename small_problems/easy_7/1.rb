=begin

Problem:
- Given two arrays, return a new array with elements from the first array at even
  indices, and elements from the second array at odd indices.
* arrays are always populated with the same number of elements
* arrays are never empty

Examples:
  ([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
  new_array << array1[0] array2[0]

Data Structures: 
- beginning: two arrays with same number of elements
- ending: one array with elements combined

Algorithm:
- Create a new empty array result
- iterate over array1, for each index:
  - append the value at array1 index to result
  - append the value at array2 index to result
- Return result

=end

def interleave(array1, array2)
  result = []

  array1.each_with_index do |element, index|
    result << element
    result << array2[index]
  end

  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
