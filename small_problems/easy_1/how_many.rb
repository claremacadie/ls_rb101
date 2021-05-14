# how_many.rb

vehicles = [
  'car', 'CAR', 'truck', 'car', 'SUV', 'TRUCK',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  array.map! {|x| x.downcase}
  types = array.uniq
  types.each do |vehicle|
    occurrences = array.count(vehicle)
    puts "#{vehicle} => #{occurrences}"
  end
end

count_occurrences(vehicles)