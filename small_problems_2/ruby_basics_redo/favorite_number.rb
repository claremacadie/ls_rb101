# favorite_number.rb

array = ['Dave', 7, 'Miranda', 3, 'Jason', 11]

favorites = []

array.each_with_index do |element, idx|
  next if idx.odd?
  favorites << [array[idx], array[idx + 1]]
end

p favorites.flatten

