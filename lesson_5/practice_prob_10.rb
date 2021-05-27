# practice_prob_10.rb

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |h|
  h.values += 1
end

p arr2