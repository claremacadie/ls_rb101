# select_fruit.rb

def select_fruit(hash)
  keys = hash.keys
  selected_fruit = {}
  counter = 0

  loop do
    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruit[current_key] = current_value
    end

    counter += 1
    break if counter >= hash.size
  end

  p selected_fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
