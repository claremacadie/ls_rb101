# sum_square_difference.rb

def sum_square_difference(n)
  sum_of_squares = 0
  sum = 0
  1.upto(n) do |i|
    sum_of_squares += i**2
    sum += i
  end
  square_of_sum = sum**2

  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
