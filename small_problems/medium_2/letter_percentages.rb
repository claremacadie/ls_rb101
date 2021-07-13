# letter_percentages.rb

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(str)
  groups = { lowercase: 0, uppercase: 0, neither: 0 }
  str.split('').each do |char|
    if LOWERCASE.include?(char)
      groups[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      groups[:uppercase] += 1
    else
      groups[:neither] += 1
    end
  end

  total = str.size
  percentages = groups.each_with_object({}) do |(k, v), hsh|
    hsh[k] = ((v.to_f / total) * 100).round(1)
  end
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
