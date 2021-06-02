# palindromes.rb

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
  p result
end

def palindrome?(str)
  chars = str.chars
  for i in 0..(str.size/2)
    return false if chars[i] != chars[-(i + 1)]
  end
end

def palindromes(str)
  substring_array = substrings(str)
  palindromes = substring_array.each_with_object([]) do |substring, arr|
    arr << substring if
      ( (substring.size > 1) && palindrome?(substring) )
  end
  p palindromes
end

p palindromes('abcd') == []
=begin
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
=end