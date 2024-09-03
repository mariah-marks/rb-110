=begin

Problem:
- Given an array of vehicles, output the vehicle type alongside the number of occurences in the array.
* values are case sensitive
* SUV is the the only value that's capitalized, the rest are all lowercase.

Examples:

  [ 'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck' ]

  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2

Data Structures:
- beginning: array
- intermediate: array of symbols, a hash of vehicle types and number of occurences
- ending: string with values interpolated

Algorithm:
- Create an array of hash keys
- Iterate over the array of keys
  - For each key, count the number of occurences in the calling array
  - assign the count as value for current key, add to a new hash
- Iterate over the hash. For each pair
  - output the key and value

=end

def count_occurrences(vehicles_array)
  keys = vehicles_array.uniq.map { |vehicle| vehicle.to_sym }

  occurences = keys.each_with_object({}) do |key, occurences|
    occurences[key] = vehicles_array.count(key.to_s)
  end

  occurences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
