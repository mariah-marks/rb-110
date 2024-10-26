=begin

Here, `password` is initialized from within the `set_password` method definition's scope.
For this reason, it's not accessible outside of that method.
To access `password` outside the method definition, we can initialize aa outerscoped local variable and assign
it to the return value from the `set_password` method call.

Because the method `verify_password` validates the password, we need to add a parameter to the method defintion,
and pass the value referenced by password when the method is invoked.

Additionally, the assignment to method local variables `new_password` and `password` can be removed, since the
value returned by `gets.chomp` only needs to be returned by the method.

=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password # if !password evaluates as true (!nil -> true)
  password = set_password
end

verify_password(password)
