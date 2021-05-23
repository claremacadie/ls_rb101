# double_odd_position.eb

def double_odd_position!(array)
  counter = 0
  loop do
    if counter.odd?
      array[counter] *= 2
    end
    counter +=1
    break if counter == array.size
  end
  array
end

my_numbers = [1, 2, 3, 4, 5]
p double_odd_position!(my_numbers) == [1, 4, 3, 8, 5]
p my_numbers