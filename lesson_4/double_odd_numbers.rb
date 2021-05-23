# double_odd_numbers.rb

def double_odd_numbers!(array)
  counter = 0
  loop do
    break if counter == array.size
    if array[counter].odd?
      array[counter] *= 2
    end
    counter += 1
  end
  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers!(my_numbers)  == [2, 4, 6, 14, 2, 6]
p my_numbers
