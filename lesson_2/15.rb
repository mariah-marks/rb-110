# Given an array of hashes, return a new array with of hashes for hashes whose values
# only contain even integers.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.values.flatten.all? do |num|
    num.even?
  end
end
