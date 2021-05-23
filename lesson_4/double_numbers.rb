# double_numbers.rb

# solution with loop
def double_numbers!(array)
  i = 0
  loop do
    array[i] *= 2
    i += 1
    break if i == array.size
  end
  array
end



=begin my solution
def double_numbers!(array)
  array.map! { |val| 2* val }
end
=end


my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) == [2, 8, 6, 14, 4, 12]
p my_numbers