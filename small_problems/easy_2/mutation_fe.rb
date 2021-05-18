# mutation_fe.rb

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = array1
array1 = array1.map do |value|
  value.start_with?('C', 'S') ? value.upcase : value
end
puts "array1 = "
p array1
puts "\n"
puts "array2 = "
p array2

# a non-mutating/non-destructive method is used to create the array1 copy
# of array1. Therefore, .upcase doesn't affect array2 because
# although it contains the same values as array1, they are not referencing the
# same memory space.