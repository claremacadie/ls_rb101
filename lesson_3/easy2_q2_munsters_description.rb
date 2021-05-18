#q2_munsters_description.rb

munsters_description = "The Munsters are creepy in a good way."

def first_conversion(string)
  string.swapcase
end

def second_conversion(string)
  string.capitalize
end

def third_conversion(string)
  string.downcase
end

def fourth_conversion(string)
  string.upcase
end


puts first_conversion(munsters_description)
puts second_conversion(munsters_description)
puts third_conversion(munsters_description)
puts fourth_conversion(munsters_description)