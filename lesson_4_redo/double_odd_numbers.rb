# double_odd_numbers.rb

def double_odd_numbers(arr)
  counter = 0
  new_arr = []

  loop do
    if counter.odd?
      new_arr << arr[counter] * 2
    else
      new_arr << arr[counter]
    end

    counter += 1
    break if counter >= arr.size
  end
  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers) == [1, 8, 3, 14, 2, 12]

# not mutated
p my_numbers == [1, 4, 3, 7, 2, 6]

