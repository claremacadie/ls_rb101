# block_word?.rb

BLOCK = { 1 => ['b', 'o'], 2 => ['x', 'k'], 3 => ['d', 'q'], 4 => ['c', 'p'],
          5 => ['n', 'a'], 6 => ['g', 't'], 7 => ['r', 'e'], 8 => ['f', 's'],
          9 => ['j', 'w'], 10 => ['h', 'u'], 11 => ['v', 'i'],
          12 => ['l', 'y'], 13 => ['z', 'm'] }

def block_word?(word)
  word.downcase!
  blocks = word.split('').each_with_object([]) do |char, arr|
    BLOCK.each do |k, v|
      arr << k if v.include?(char)
    end
  end
  blocks.uniq == blocks ? true : false
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
