# merge_sort.rb
require 'pry'

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def divide_array_in_two(arr)
  size = arr.size
  return arr if size == 1
  mid_point = (size / 2) - 1

  temp_arr = []
  temp_arr << arr[0..mid_point] << arr[(mid_point + 1)..]

  arr.clear
  arr << temp_arr[0] << temp_arr[1]
end

def nest(arr)
  divide_array_in_two(arr).each do |sub_arr|
    nest(sub_arr) if sub_arr.size > 1
  end
  arr
end

def merge_nested(arr)
  arr1 = (arr[0].size == 2) ? merge_nested(arr[0]) : arr[0]
  arr2 = (arr[1].size == 2) ? merge_nested(arr[1]) : arr[1]
  merge(arr1, arr2)
end

def merge_sort(array)
  merge(nest(array))
  #nest = nest(array)
  #merge_nested(nest)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
