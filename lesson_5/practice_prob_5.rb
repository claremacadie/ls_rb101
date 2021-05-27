# practice_prob_5.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


male_munsters = munsters.select { |person, v| v["gender"] == "male" }
p male_munsters.values.inject(0) {|sum, p| sum + p["age"] }

sum = 0
munsters.each do |person|
  if person[1]["gender"] == "male"
    sum += person[1]["age"]
  end
end

p sum