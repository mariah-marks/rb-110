=begin

Problem:
- given two arrays of integers, return a new array of products.
* the arrays have the same number of elements

Examples:
([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Data Structures:
- beginning: two arrays
- ending: one array

Algorithm:
- SET array_1 and array_2
- Iterate over array_1 using map and with_index
  - for each index multiply the element in array_1 by array_2
  - return the product to map
- Return the new array
=end

def multiply_list(array_1, array_2)
  array_1.map.with_index do |number, index|
    number * array_2[index]
  end
end


# Further exploration:
def multiply_list_2(array_1, array_2)
  array_1.zip(array_2).map { |subarray| subarray[0] * subarray[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list_2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
