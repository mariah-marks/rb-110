=begin

This method uses recursion, but doesn't specify a base case, so the method continues to be called
until the stack limit is reached.

The method local variable `n` indicates the number of elements to be removed from `from_array` and appended to
`to_array`. On line 2, the first element is removed and added to the second array. On line 3, the method is
called again, with `n-1` as the first argument. By adding a return statement at the top of the method definition,
the innermost recursive call will return to the method that called it when the base case is reached.

Further Exploration:

  If from_array is smaller than `n`, the shift method will return `nil` when from_array is empty, and
`nil` will be appended to to_array for every value that `n` is greater than the element count of from_array.

=end

def move(n, from_array, to_array)
  return if n.zero?(0)

  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
