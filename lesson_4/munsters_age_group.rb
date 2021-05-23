# munsters_age_group.rb

# solution with case and range

def add_age_group(hash)
  hash.map do |key, value|
    case hash[key]["age"]
    when 0..17
      hash[key]["age_group"] = "junior"
    when 18..64
      hash[key]["age_group"] = "adult"
    else
      hash[key]["age_group"] = "senior"
    end
  end
  hash
end

# my solution
=begin
def add_age_group(hash)
  hash.map do |key, value|
    if hash[key]["age"] < 18
      hash[key]["age_group"] = "junior"
    elsif hash[key]["age"] < 65
      hash[key]["age_group"] = "adult"
    else
      hash[key]["age_group"] = "adult"
    end
  end
  hash
end
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p add_age_group(munsters)