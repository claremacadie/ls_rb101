# med2_q6_simplify_method.rb

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

puts color_valid("blue")
puts color_valid("green")
puts color_valid("red")


def color_valid2(color)
  color == "blue" || color == "green"
end

puts color_valid2("blue")
puts color_valid2("green")
puts color_valid2("red")