# balanced?.rb

def balanced?(str)
  counter = []
  str.chars.each do |char|
    if char == '('
      counter.unshift(char)
    elsif char == ')'
      counter[-1] == '(' ? counter.pop : (return false)
    end
  end
  counter.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
