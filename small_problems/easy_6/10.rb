=begin

What will the code print and why?

  On line 3, we call `each` on the array referenced by `array1`. From within the block
  argument passed to `each`, we append each element to `array2`, meaning that two different
  array objects are now referencing the same element objects.

  On line 4, we mutate the values for which `start_with?('C', 'S')` returns true. Because
  both arrays are referencing the same objects, the output following the exectution of line 5
  will be

  Moe
  Larry
  CURLY
  SHEMP
  Harpo
  CHICO
  Groucho
  Zeppo

=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
