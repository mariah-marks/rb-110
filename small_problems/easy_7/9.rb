=begin

Problem:
- Given two arrays, return an array of products between every possible pair of elements between two
  arrays.
* The elements should be sorted from smallest to largest
* arrays have a different # of elements
* duplicate products are included
* arrays are never empty

Examples:
  ([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
  
  [ [2 4] -> 8
    [2 3] -> 6
    [2 1] -> 2
    [2 2] -> 4
    [4 4] -> 16
    [4 3] -> 12
    [4 1] -> 4
    [4 2] -> 8 ]

  [8 6 2 4 16 12 4 8] -> [2 4 4 6 8 8 12 16]

Data Structures:
- beginning: two arrays of integers
- intermediate: nested array with each combination (as two-element subarray)
- ending: one array of products

Algorithm:
- Create a nested array with each possible combination as a two-element subarray.
- Iterate over the nested array and return a new array of products.
  - for each subarray element, return the product of the first and second element.
- Sort and return the products array

=end

def multiply_all_pairs(list_1, list_2)
  pairs = list_1.product(list_2)

  pairs.map do |subarray|
    subarray[0] * subarray[1]
  end.sort

end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
