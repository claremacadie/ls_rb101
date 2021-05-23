# flintstones_hash.rb

def names_to_keys(array)
  key_hash = {}
  array.each_with_index do |name, index|
    key_hash[name] = index
  end
  key_hash
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p names_to_keys(flintstones) == { "Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4, "BamBam" => 5 }