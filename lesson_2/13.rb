# Transform the nested array so the subarrays are ordered by comparing only the odd integers.
# Return a new array.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

arr.sort_by do |subarray|
  subarray.select do |num|
    num.odd?
  end
end
