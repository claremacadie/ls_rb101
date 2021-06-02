# practice_prob_13.rb

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort_by do |a|
  a.reject { |i| i.even? }
end

p arr
p arr2