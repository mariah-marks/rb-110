# Given a hash, remove any values greater than `100`.

# input:
# { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# output:
# {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |name, age| age < 100 }