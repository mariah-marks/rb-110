=begin

Given a section of text, output the longest sentence and the number of words.
* words are any set of characters separated by spaces
  - this includes "--"

Examples:

  Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.

  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.

  "Four score and seven years ago .. Now we are engaged"
  -> ["Four score ..", "Now we are engaged..", ...]
  ["Four score ..", "Now we are engaged.."] -> [[Four Score ..], [Now we are engaged..], ...]
  * Split counts trailing newline characters as whitespace

Data Structures:
- input: section of text
- intermediate:
  - collection of sentences
    - collection of words for each sentence
- ouput: sentence with the most words, word count

Algorithm:
- Transform the string into collections of sentences
  - Create a new collection with each string sentence as an argument
    - sentences are delimited by punctuation marks
    - words delimited by spaces
  - transform each string collection element to an array of words
- Count the number of word elements in each subarray
  - iterate over the array of sentences
    - for each sentence, convert to a subarray of words
    - count the number of words
    - select the sentence with the greatest number of words
- Output the subarray with the greatest number of elements as a string
  - convert the selected sentence back to a string
=end

def longest_sentence(text)
  sentences = text.split(/\.|\?|!/)
  words_in_sentence = sentences.map(&:split)

  longest_sentence = words_in_sentence.max_by(&:count)
  puts "The longest sentence is:\n#{longest_sentence.join(' ')}."
  puts "\nIt has #{longest_sentence.count} words."
end

passage = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

longest_sentence(passage)
