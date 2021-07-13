# rotate90.rb

def rotate180(array)
  new_array = []
  array.reverse.each do |row|
    new_array << row.reverse
  end
  new_array
end

def rotate270(array)
  old_width = array[0].size
  old_height = array.size
  new_array = []
  old_width.times { new_array << [] }

  array.each_with_index do |row, i|
    row.reverse.each_with_index do |column, j|
      new_array[j] << column
    end
  end
  new_array
end

def rotate90(array)
  old_width = array[0].size
  old_height = array.size
  new_array = []
  old_width.times { new_array << [] }

  array.reverse.each_with_index do |row, i|
    row.each_with_index do |column, j|
      new_array[j] << column
    end
  end
  new_array
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate180(matrix1)
p rotate180(matrix2)

p rotate270(matrix1)
p rotate270(matrix2)
