# Sum the ages of the male family members.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_total_age = 0

munsters.each do |name, data|
  male_total_age += data["age"] if data["gender"] == "male"
end

male_total_age