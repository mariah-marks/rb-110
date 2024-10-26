=begin

This method isn't working as expected because the `words` array is being mutated during iteration.
On the second iteration, the second element is removed from the array, and the original array is mutated.
On the third iteration, the third element, which is now `"cards"` is passed to the block, and `"boring"`
isn't evaluated, because it is now the second array element.

Because mutating the caller during iteration can produce unexpected results, we can return a new array
with the negative words omitted instead of mutating the original array.

=end

def neutralize(sentence)
  words = sentence.split(' ') # returns an array of words
  words.reject { |word| negative?(word) }.join(' ')
end

def negative?(word)
  %w[dull boring annoying chaotic].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
