# Given a string, create a new hash with each letter as the key, and an integer representation of the letter's occurances as the value. The hash keys should be sorted by integer ordinal.

# input:
# "The Flintstones Rock"

# ouput:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"
letters_array = statement.delete(" ").chars.sort

letters_hash = letters_array.each_with_object({}) do |letter, letters_hash|
  letters_hash[letter] = letters_array.count(letter)
end

p letters_hash