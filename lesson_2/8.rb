# For each value in the hash, output the vowels in each string.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], \
fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each do |_, array|
  array.each do |word|
    letters = word.chars

    letters.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end
