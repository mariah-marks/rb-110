# Given an array, return the index of the first element beginning with `"Be"`.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.find_index { |name| name.start_with? "Be" }
