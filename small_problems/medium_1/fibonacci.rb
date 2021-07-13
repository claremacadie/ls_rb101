# fibonacci.rb

=begin
# solution with recursion
def fibonacci(n)
  return 1 if n == 1
  return 1 if n == 2
  fibonacci(n-1) + fibonacci(n-2)
end

=end

# solution without recursion
def fibonacci(int)
  fib = [1, 1]
  1.upto(int-2) { fib << fib[-1] + fib[-2] }
  p fib[int-1]
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)
