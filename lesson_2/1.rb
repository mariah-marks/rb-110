# Sort an array of integers represented as strings from largest to smallest.

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end
