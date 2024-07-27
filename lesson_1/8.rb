# In the first example, `1` is output and then the element `numbers[0]` is removed.
# On the following iteration, `3` is output, because `3` is now the second element. 
# The first element `2` is removed from the array and execution stops.
# The value `4` is never output because following the second iteration,
# the array only contains two elements, and the `#each` method has already passed two
# arguments to the block.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# In the second example on the first iteration, the number `1` is output and the last
# element `numbers[3]` is removed. On the second iteration, the number `2` is output, 
# because `2` is still the second element. The last element `numbers[3]` is removed and 
# execution stops, because the array now contains two elements, and two elements have
# already been passed to the block.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
