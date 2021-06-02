# sequence.rb

def sequence(int)
  arr = []
  case
  when int == 0 then arr = [0]
  when int >= 1 then (1..int).to_a
  when int <= -1 then (int..-1).to_a
  end
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [0]
p sequence(-1) == [-1]
p sequence(-2) == [-2, -1]
