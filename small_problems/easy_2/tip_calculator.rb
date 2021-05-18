# tip_calculator.rb

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

tip_decimal = tip_percent / 100
tip = bill * tip_decimal
total = bill + tip

# two different ways to round to 2 decimal places, and enforce 2 d.p. e.g. 4.20
puts "The tip is £%0.2f" %tip + "."
puts "The total is £#{sprintf("%0.2f", total)}."