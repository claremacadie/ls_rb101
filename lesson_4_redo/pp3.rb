# pp3.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! { |_, v| v>= 100}

p ages

p ages.min

p ages.values.min