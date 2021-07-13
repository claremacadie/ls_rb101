# pp10.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

AGE_GROUPS = { "kid" => (0..17), "adult" => (18..64), "senior" => (65..) }

munsters.map do |name, details|
  case
  when AGE_GROUPS["kid"].include?(details["age"])
    details["age_group"] = "kid"
  when AGE_GROUPS["adult"].include?(details["age"])
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters