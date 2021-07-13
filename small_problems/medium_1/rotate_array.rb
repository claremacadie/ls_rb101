# rotate_array.rb

def rotate_array(arr)
  new_arr = []
  arr.each_with_index do |element, i|
    next if i == 0
    new_arr << element
  end
  new_arr << arr[0]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

# test cases for rotate_integer
p rotate_integer(1234) == 2341
p rotate_integer(23) == 32
p rotate_integer(1) == 1

=begin
# test cases for rotate_string
p rotate_string("abc") == "bca"
p rotate_string("The dog jumped over the fence") == "he dog jumped over the fenceT"
p rotate_string("") == ""
p rotate_string("a") == "a"
=end

=begin
# test cases for rotate_array
  raise 'A test exception.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
else
  # other exception
ensure
  # always executed
endp rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
=end