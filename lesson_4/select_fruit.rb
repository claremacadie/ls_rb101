# select_fruit.rb

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# Solution using loop
def select_fruit(hash)
  i = 0
  keys = hash.keys
  values = hash.values
  hash_of_fruit = {}
  loop do
    if values[i] == "Fruit"
      hash_of_fruit[keys[i]] = 'Fruit'
    end
    i += 1
    break if i == hash.size
  end
  p hash_of_fruit
end

# One line solution
=begin
def select_fruit(hash)
  fruit_hash = hash.select { |key, value| value == 'Fruit' }
end
=end

p select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}