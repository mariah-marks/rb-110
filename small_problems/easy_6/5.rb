=begin

Return a new array with values reversed.
* Don't mutate original array or use #reverse method

Examples:

[1, 2, 3, 4]) == [4, 3, 2, 1]

0 -> -1
1 -> -2
2 -> -3
3

Data Structures:
- beginning: array
- ending: new array

Algorithm:
1. TRANSFORM array so values are ordered in reverse
- Iterate over input array
  - Return a new array of return values from the block
    - set an index variable to -1
    - on each iteration, decrement index by 1
    - return the value at index
2. RETURN new array
=end

def reverse(input)
  input.map.with_index { |num, index| input[-index - 1] }
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse(['abc']) == ['abc']                   # => true
p reverse([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true
