# even_or_odd.rb

count = 1

loop do
  count.odd? ? (puts "#{count} is odd") : (puts "#{count} is even")
  count += 1
  break if count > 5
end