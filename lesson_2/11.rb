# Using `#select`, return a new nested array containing only integer elements that are
# multiples of 3. If the subarray contains no multiples of 3, return an empty array for
# that element.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |subarray|
  subarray.select do |number|
    number % 3 == 0
  end
end
