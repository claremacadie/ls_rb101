# reverse_array_2.rb

# solution with inject
def reverse(array)
  array.inject([]) { |new, val| new.unshift(val) }
end

# solution with each_with_object
=begin def reverse(array)
  array.each_with_object([]) { |val, new| new.unshift(val) }
end
=end

# my solution
=begin
def reverse(array)
  number_of_swaps = array.size - 1
  new_array = []
  for i in 0..number_of_swaps
    new_array[i] = array[-(i+1)]
  end
  new_array
end
=end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true