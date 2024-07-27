# Without using `#to_h`, transform the nested array to a hash. For each subarray, the
# first element should be the key and the second element should be the value.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr.each_with_object({}) do |subarray, new_hash|
  new_hash[subarray[0]] = subarray[1]
end
