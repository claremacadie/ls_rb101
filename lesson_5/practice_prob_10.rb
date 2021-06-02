# practice_prob_10.rb

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# model solution
arr2 = arr.map do |h|
  incremented_h = {}
  h.each do |k, v|
    incremented_h[k] = v + 1
  end
  incremented_h
end
p arr
p arr2


# my solution
arr2 = arr.map do |h|
  h.transform_values { |v|v += 1 }
end
p arr
p arr2
