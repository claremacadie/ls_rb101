# pp7.rb

statement = "The Flintstones Rock"

hash = {}

statement.chars.uniq.each do |char|
  hash[char] = statement.count(char)
end

p hash