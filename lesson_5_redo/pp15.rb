# pp15.rb

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.all? do |_k, v|
    v.all? { |num| num.even? }
  end
end

p new_arr
