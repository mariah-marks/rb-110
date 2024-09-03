=begin

Problem:
- Given an array, return a new array with elements at every other
  index
* only the elements at even indices are returned
* an array is always returned

Examples:
  [2 3 4 5 6] -> [2 4 6]
  [abc def] -> [abc]
  [] -> []

Data Structures:
- beginning: an array
- ending: an array of elements at even indices

Algorithm:
- SELECT values at even indices
  - Create new array
    - `result`
  - Iterate over input array
  - Check if index is even,
    - if true, push to `result`
- RETURN result

=end

def oddities(input)
  input.select.with_index { |num, index| num if index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
