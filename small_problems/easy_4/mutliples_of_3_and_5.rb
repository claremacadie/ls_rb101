# multiples_of_3_and_5.rb

def multisum(max_num)
  multiples = []
  for i in 1..max_num
    if (i % 3 == 0) || (i % 5 == 0)
      multiples << i
    end
  end
  multiples.inject { |sum, num| sum + num }
end

=begin my solution
def multisum(max_num)
  sum_of_multiples = 0
  1.upto(max_num) do |num|
    if num % 3 == 0
      sum_of_multiples += num
    elsif num % 5 == 0
      sum_of_multiples += num
    end
  end
  sum_of_multiples
end
=end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168