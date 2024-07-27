# Modify each element in the array so that is only three characters long.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0..2]
end
