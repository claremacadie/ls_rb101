# triangle.rb

def triangle(a, b, c)
  sides = [a, b, c].sort
  min_sides = sides[0..1]
  max_side = sides[2]
  return :invalid if (max_side >= min_sides.sum || sides.min <= 0)
  return :equilateral if (a == b && b == c)
  return :isosceles if (a == b || a == c || b == c)
  return :scalene

end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
