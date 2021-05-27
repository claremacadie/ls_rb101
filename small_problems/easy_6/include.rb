# include.rb

def include?(array, val)
  array.any?(val)
end

=begin
def include?(array, val)
  i = 0
  boolean = false
  loop do
    break if i >= array.size
    if array[i] == val
     boolean = true
    end
    i += 1
  end
  boolean
end
=end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false