# mulitply_array.rb

def multiply(arr, num)
  counter = 0
  new_arr = []

  loop do
    new_arr << arr[counter] * num
    counter += 1
    break if counter >= arr.size
  end

  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]