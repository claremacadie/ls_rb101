# transpose.rb

# model_solution
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# my_solution
def transpose!(array)
  array[1][0], array[0][1] = array[0][1], array[1][0]
  array[0][2], array[2][0] = array[2][0], array[0][2]
  array[1][2], array[2][1] = array[2][1], array[1][2]
end

=begin
# my_solution
def transpose(array)
  new_array = [[], [], []]
  for i in 0..2
    for j in 0..2
      if i == j
        new_array[i][j] = array[i][j]
      else
        new_array[i][j] = array[j][i]
      end
    end
  end

  new_array
end
=end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
