# pp5.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

males = munsters.select do |_, v|
  v["gender"] == "male"
end

p males.inject(0) {|sum, (_, v)| sum + v["age"]}

munsters.each do |k, v|
  puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}."
end

