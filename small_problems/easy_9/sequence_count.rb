# sequence_count.rb

def sequence(count, first_num)
  return [] if count == 0
  arr = []
  accumulator = 0
  for i in 1..count
    accumulator += first_num
    arr << accumulator
  end
  arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
