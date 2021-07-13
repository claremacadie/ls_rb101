# double_numbers.rb

def double_numbers!(arr)
  counter = 0

  loop do
    arr[counter] *= 2
    counter += 1
    break if counter >= arr.size
  end

  arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) == [2, 8, 6, 14, 4, 12]
