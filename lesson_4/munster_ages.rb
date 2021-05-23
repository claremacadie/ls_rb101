# munster_ages.rb

def add(hash)
  hash.values.sum
end

def remove_ages(hash, max_age)
  hash.reject { |key, value| value > max_age }
end

def minimum(hash)
  ages = hash.values
  current_age = ages[0]
  for age in ages
    if age < current_age
      current_age = age
    end
  end
    current_age
end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p add(ages) == 6174

p remove_ages(ages, 100) == { "Herman" => 32, "Lily" => 30, "Eddie" => 10, "Marilyn" => 22 }

p minimum(ages) == 10