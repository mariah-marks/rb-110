=begin

given a string, remove any non-alphabetic numeric characters. The result should include a spaces in place of
non-alphabetic characters, but with no consecutive spaces.

Example:
"---what's my +*& line?" == ' what s my line '
[---what's my +*& line?] -> [ " what s", "my", " ", "line "]
" what s my  line " -> " what s my line "

Data structure:
- string
- array of strings
- string

Algorithm:
- create a new array, assign each "word" as an element
- for each element, check if each character is a letter
  - delete any characters that are not letters, and replace with one space.
- join the array elements as a string
- remove any duplicates of space # squeeze(" ")
- return string

=end

def cleanup(string)
  letters = ("a".."z").to_a
  words_array = string.split

  words_array.map do |word|
    unless letters.include?(word.chars)
    word.gsub(letter)
    end
  end
end


p cleanup("---what's my +*& line?") #== ' what s my line '

# Select builds it's array out of the same objects

arr = ['1', '2', '5', '3', '4']

selected_arr = arr.select { |n| n > '0' }

selected_arr = arr.map { |el| el.dup }


