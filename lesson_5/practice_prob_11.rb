# practice_prob_11.rb

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |a|
  a.select { |v| v % 3 == 0}
end

p arr
p arr2