# merge.rb

# solution with mutation
=begin def merge(a, b)
  new_array = []
  loop do
    if (a.empty? || b.empty?)
      new_array << a << b
      break
    else
      a[0] <= b[0] ? (new_array << a.shift) : (new_array << b.shift)
    end
  end
  new_array.flatten
end
=end

# solution without mutation
def merge(a, b)
  new_array = []
  i, j = 0, 0
  loop do
    if i >= a.size
      new_array << b[j..]
      break
    elsif j >= b.size
      new_array << a[i..]
      break
    elsif a[i] <= b[j]
      new_array << a[i]
      i += 1
    else
      new_array << b[j]
      j += 1
    end
  end
  new_array.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
