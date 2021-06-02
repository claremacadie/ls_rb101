# palindromes_2.rb

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

def palindrome?(str)
  (str.size > 1) && (str == str.reverse)
end

def clean(str)
  clean_chars = str.chars.each_with_object([]) do |char, arr|
    arr << char if char =~ /[A-z0-9]/
  end
  clean_str = clean_chars.join
end

def palindromes(str)
  substring_array = substrings(str)
  palindromes = substring_array.each_with_object([]) do |substring, arr|
    palindrome?(substring)
    clean_str = clean(substring)
    arr << clean_str if palindrome?(clean_str)
  end
  palindromes
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')
