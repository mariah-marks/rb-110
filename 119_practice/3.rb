# Create a method that takes a string argument and returns a copy of the string with every second
# character in every third word converted to uppercase. Other characters should remain the same.

=begin

input: string
output: new string
* every second character in every 3rd word is converted to uppercase
  * odd index values are upcased in every 3rd word

Examples:
  'Lorem Ipsum is simply dummy text of the printing world'
    [2] 'iS' - odd index values are upcased
    [5]  'tExT'
    [8]  'pRiNtInG'
    ... 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'

Algorithm:
 - create an array of words
 - mutate that array, by replacing the words at every 3rd index
  - set index = 2
    upcase odd idx values in arr[index]
    increment index by 3
- convert the array back to a string

=end

def upcase_odd_chars!(word)
  chars = word.chars.each_with_index do |letter, index|
    letter.upcase! if index.odd?
  end.join
  word.replace(chars)
end

def to_weird_case(sentence)
  words = sentence.split
  index = 2

  loop do
    break if index > words.size - 1
    upcase_odd_chars!(words[index])
    index += 3
  end

  words.join(' ')
end

# solution 2:

def get_every_third_index(words)
  indices = []

  (2...words.size).step(3) do |idx|
    indices << idx
  end
  indices
end

def transform_word(word)
  word.chars.map.with_index do |char, index|
    index.odd? ? char.upcase : char
  end.join
end

def to_weird_case(str)
  words = str.split
  every_third_index = get_every_third_index(words)

  words.map.with_index do |word, index|
    every_third_index.include?(index) ? transform_word(word) : word
  end.join(' ')
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

# 20 mins