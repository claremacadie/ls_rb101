def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
  # use the following line to make explicit what is being mutated and returned
  return a_string_param, an_array_param # NB this does not change the functionality of the method, it outputs the same thing with or without this line.
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"