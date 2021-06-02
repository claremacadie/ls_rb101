# staggered_case_choice_2.rb

def staggered_case_choice(string, choice = true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if choice == true
      if char =~ /[a-z]/i
        if need_upper
          result += char.upcase
        else
          result += char.downcase
        end
        need_upper = !need_upper
      else
        result += char
      end
    else
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    end
  end
  p result
end

p staggered_case_choice('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
p staggered_case_choice('ALL CAPS', false) == 'AlL CaPs'
p staggered_case_choice('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
