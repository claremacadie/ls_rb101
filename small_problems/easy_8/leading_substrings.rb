# leading_substrings.rb

def leading_substrings(str)
  accumulator = ''
  substring_arr = []
  str.chars.each do |char|
    accumulator += char
    substring_arr << accumulator
  end
  substring_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
