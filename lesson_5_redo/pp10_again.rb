# pp10_again.rb

h = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new = h.map do |hsh|
  hsh.each do |k, v|
    hsh[k] = v + 1
  end

end

p new