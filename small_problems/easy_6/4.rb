require 'pry-byebug'

=begin

Problem:
- Given an array, mutate the array so the elements are ordered in reverse.
* Don't use #reverse or #reverse!

Examples:
  [1 2 3 4] -> [4 3 2 1]
  [0] -> [-1]
  [1] -> [-2]


  [1 2 3 4 1] -> [1 4 3 2 1]
    element[0] = element[-1], element[-1] = element[0]
    element[1] = element[-2], element[-2] = element[1]
    element[2] = element[-2]

  [a b e d c] -> [c d e b a]

  [abc] -> [abc]

  [] -> []


Data Structures:
- beginning: array of integers
- intermediate: iterate over the input array, use a mutating method call within the block
- ending: same array of integers mutated


Algorithm:
1. Return an empty array if the array is empty
2. TRANSFORM array so that values are assigned to index opposite
  - use multiple assignment and element assignment to simultaneously re-assign the values
  at opposite indices.
2. return the array

=end

def reverse!(array)
  return [] if array.empty?

  first_idx = 0
  last_idx = array.size - 1

  loop do
    array[first_idx], array[last_idx] = array[last_idx], array[first_idx]
    break if first_idx + 1 == last_idx || first_idx == last_idx
    first_idx += 1
    last_idx -= 1
  end

  array
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = [1, 2, 3, 4, 1]
result = reverse!(list)
p result == [1, 4, 3, 2, 1] # true
p list == [1, 4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
