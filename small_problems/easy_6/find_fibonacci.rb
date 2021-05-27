# find_fibonacci.rb

def find_fibonacci_index_by_length(int)
  fib = [1, 1]
  while fib[-1].to_s.length <= int
    fib << fib[-1] + fib[-2]
  end
  fib.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847