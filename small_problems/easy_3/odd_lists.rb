# odd_lists.rb

def oddities(array)
  odd_elements = []
  for i in 0..(array.size - 1)
    array[i]
   odd_elements.push(array[i]) if (i % 2 == 0)
  end
  odd_elements
end

def oddities2(array)
  odd_elements = []
  array.each_with_index do |element, index|
   odd_elements.push(element) if index % 2 == 0
  end
  odd_elements
end

def oddities3(array)
  odd_elements = []
  i = 0
  while i < (array.size)
   odd_elements << array[i]
   i += 2
  end
  odd_elements
end

def evenies(array)
  odd_elements = []
  for i in 0..(array.size - 1)
    array[i]
   odd_elements.push(array[i]) if (i % 2 == 1)
  end
  odd_elements
end

p oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities3(['abc', 'def']) == ['abc']
p oddities3([123]) == [123]
p oddities3([]) == []

=begin
p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p evenies([2, 3, 4, 5, 6]) == [3, 5]
p evenies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenies(['abc', 'def']) == ['def']
p evenies([123]) == []
p evenies([]) == []
=end

