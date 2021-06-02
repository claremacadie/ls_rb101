# letter_case_count.rb

def letter_case_count(string)
  hsh = {lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    case
    when ('a'..'z').to_a.include?(char) then hsh[:lowercase] += 1
    when ('A'..'Z').to_a.include?(char) then hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }