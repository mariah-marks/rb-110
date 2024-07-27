# Create a new hash with a key-value pair for each element. In the new hash,
# each element should be the key, with the corresponding index as the value.

# input:
# ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# output: 
# {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

flintstones_hash = {}
flintstones.each_with_index do |element, index|
  flintstones_hash[element] = index
end
