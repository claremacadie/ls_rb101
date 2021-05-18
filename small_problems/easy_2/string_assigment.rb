# string_assignment.rb

name = 'Liz' # variable 'name' is assigned to memory space containing 'Liz'
save_name = name # variable 'save_name' is assigned to the same memory space as 'name', a memory space containing 'Liz'
name.upcase! # this is a mutating/destructive method, so it changes the object 'name' is referring to so it now contains 'LIZ'
puts name, save_name # this outputs LIZ, LIZ because save_name is pointing to the same memory space as name and the object in that space has been permanently changed.