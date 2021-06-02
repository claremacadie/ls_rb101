# substrings.rb

# solution with upto
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(str)
  result = []
  0.upto(str.size - 1) do |index|
    result.concat(leading_substrings(str))
    str.slice!(0)
  end
  result
end


# my solution
=begin
def substrings(str)
  chars = str.chars
  accumulator = ''
  substrings = []
  i = 0
  loop do
    break if i >= (str.length)
    chars.each do |char|
      accumulator += char
      substrings << accumulator
    end
    i += 1
    chars.shift
    accumulator = ''
  end
  substrings
end
=end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
