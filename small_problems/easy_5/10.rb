=begin

The code will return a different object. The `#split` method returns a new array object
substrings as elements.

=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end
p spin_me("hello world") # "olleh dlrow"

