# stoplight.rb

stoplight = ['green', 'yellow', 'red'].sample

message = case stoplight
          when "green" then "Go!"
          when "yellow" then "Slow down!"
          when "red" then "Stop!"
          end

puts message

if stoplight == 'green'
  puts "Go!"
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

