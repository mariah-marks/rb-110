=begin

The code should count down from 10 to one, but instead 10 is being output 10 times.
The error occurs because the `decrease` method doesn't mutate the calling object.
To resolve this, we can re-assign `counter` to the return value of the `decrease` method invocation.
Addiitonally, the re-assignment of `counter` on line 2 can be omitted, since we only need the return value
from the expression `counter - 1`.

=end

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
