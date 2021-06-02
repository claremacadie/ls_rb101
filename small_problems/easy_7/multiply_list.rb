# multiply_list.rb

# solution with zip
def multiply_list(arr1, arr2)
  (arr1.zip(arr2)).map { |arr| arr[0]*arr[1] }
end

# my solution
=begin def multiply_list(arr1, arr2)
  product = []
  arr1.each_with_index { |_, i| product << (arr1[i] * arr2[i]) }
  product
end
=end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]