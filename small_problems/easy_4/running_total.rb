# running_total.rb

=begin my solution
def running_total(array)
  running_total = 0
  running_total_array = []
  array.each do |num|
    running_total += num
    running_total_array << running_total
  end
  running_total_array
end
=end

=begin better to use map
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end
=end

# solution with each_with_object
def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, result|
    sum += num
    result << sum
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []