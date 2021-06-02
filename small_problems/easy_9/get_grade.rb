# get_grade.rb

def get_grade(int1, int2, int3)
  mean_av = (int1 + int2 + int3) / 3
  case mean_av
  when (80...90) then "B"
  when (70...80) then "C"
  when (60...70) then "D"
  when (0...60) then "D"
  else                "A"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
