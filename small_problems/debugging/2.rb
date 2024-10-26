=begin

Here, we pass a string to the `shout_out_to` method. From within the method, we create a new array object with each
character in the string as an element. We then call `each` on that array. From within the block passed to our each
method, we call the mutating `upcase!` method on each element. Because the mutating upcase method was called on the
elements in our new array, the original string object isn't mutated.

To resolve this, we can call `upcase` directly on the `name` variable. This also means that we don't need to create an
array on line 2.

=end

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'
