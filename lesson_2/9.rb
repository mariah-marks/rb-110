# Transform the the nested array by sorting numbers from largest to smallest and 
# words/letters in reverse alphabetical order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |subarray|
  subarray.sort do |a, b|
    b <=> a
  end
end)
