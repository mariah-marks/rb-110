# Given a sentence, create and a new string with the first letter of each word capitalized.

words = "the flintstones rock"

words.split.each_with_object([]) do |word, array|
 array << word.capitalize
end.join(" ")