numbers = [1, 2, 3, 4]

numbers.each do |number|
  number
  numbers.shift(1)
end