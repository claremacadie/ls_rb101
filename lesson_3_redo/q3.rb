# q3.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)



=begin
additional_ages.each do |k, v|
  ages[k] = v
end

p ages
=end