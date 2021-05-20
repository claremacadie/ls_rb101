# century.rb

def century_suffix(century)
  return 'th' if (century % 100 >= 11) && (century % 100 <= 13)
  case century % 10
  when 1 then"st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

def century(year)
  century = ((year - 1) / 100) + 1
  suffix = century_suffix(century)
  "#{century.to_s}#{suffix}"
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'