# halvsies.rb

def halvsies(array)
  sub_array_size = (array.size + 1) / 2
  sub_array_1 = array[0, sub_array_size]
  sub_array_2 = array[sub_array_size, array.size]
  new_array = [sub_array_1, sub_array_2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]