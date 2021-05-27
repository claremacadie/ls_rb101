# practice_prob_9.rb

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |arr|
  arr.sort.reverse
end

p arr2