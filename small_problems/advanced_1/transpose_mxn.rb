# transpose_mxn.rb

# my_solution
def transpose(array)
  total_rows = array.size
  total_columns = array.first.size

  new_array = []
  total_columns.times { new_array << [] }
  
  for i in 0...total_columns
    for j in 0...total_rows
      if i == j
        new_array[i][j] = array[i][j]
      else
        new_array[i][j] = array[j][i]
      end
    end
  end

  new_array
end

# modified model solution from previous 3x3 exercise
=begin
def transpose(matrix)
  total_columns = matrix[0].size
  total_rows = matrix.size
  result = []
  (0...total_columns).each do |column_index|
    new_row = (0...total_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end
=end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

