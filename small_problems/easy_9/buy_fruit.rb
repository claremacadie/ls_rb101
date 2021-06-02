# buy_fruit.rb

def buy_fruit(arr)
  fruit = arr.each_with_object([]) do |sub_arr, fruit|
    sub_arr[1].times { fruit << sub_arr[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
