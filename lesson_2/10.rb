# Without altering the original array, use `#map` to transform the array so that
# each hash value is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  hash.each_with_object({}) do |(letter, number), new_hash|
    new_hash[letter] = number + 1
  end
end
