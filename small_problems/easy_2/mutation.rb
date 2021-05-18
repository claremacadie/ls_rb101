# mutation.rb

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

#array2 is affected by the upcase! because it is a mutating/destructive method, and
# << means that array2 elements points to the same memory space as array1 elements.