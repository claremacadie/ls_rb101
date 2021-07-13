# ignoring_case.rb

name = 'Roger'
name2 = 'Dave'

def compare_no_case(str1, str2)
  puts str1.casecmp(str2) == 0
end

def compare_case(str1, str2)
  puts str1 == str2
end

compare_no_case(name, 'RoGeR')
compare_case(name, name2)