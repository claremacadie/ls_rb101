# interleave.rb

# solution with Array#zip
def interleave(a,b)
  a.zip(b).flatten
end

# my solution
=begin def interleave(a, b)
  arr = []
  for i in 0 ..(a.size - 1)
    arr << a[i]
    arr << b[i]
  end
  arr
end
=end
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']