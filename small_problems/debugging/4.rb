=begin

The issue here is that we are trying to call `String#+` with an empty array object as one of it's arguments.
On the first iteration, the expression on line 7 `words[0]` returns the first string element in the array.
We then call the `+` method on this string, and pass the empty array referenced by `reversed_words` as an argument.
While `+` is defined for both Arrays and Strings, `String#+` only accepts a string objects as arguments.

Instead of `String#+`, we can prepend each value to the empty array using `Array#unshift`
=end


def reverse_sentence(sentence) # string input
  words = sentence.split(' ') # string converted to array with each element as a word
  reversed_words = []

  i = 0
  while i < words.length # number of elements in words: 4
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing') == 'doing you are how'
