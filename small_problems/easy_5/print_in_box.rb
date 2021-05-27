# print_in_box.rb

def print_in_box(str)
  if str.length < 76
    box_width = str.length + 2
    sentence_array = []
    sentence_array[0] = str
  else
    box_width = 76
    text_line = str
    words = str.split
    sentence_array = []
    line_word_array = []
    line_string = ''
    line_string_number = 0
    word_number = 0
    loop do
      if line_string.length + words[word_number].length + 1 <= 76
        line_word_array << words[word_number]
        line_string = line_word_array.join(' ')
        sentence_array[line_string_number] = line_string
      else
        sentence_array[line_string_number] = line_string
        line_string_number += 1
        line_word_array = []
        line_word_array << words[word_number]
        line_string = ''
      end

      word_number += 1
      break if word_number >= words.size

    end

  end

  cross_line = '+' + '-' * box_width + '+'
  pipe_line = '|' + ' ' * box_width + '|'
  puts cross_line
  puts pipe_line

  sentence_array.each do |line|
    if str.length < 76
      padding = 0
    else
      text_length = line.size
      padding = 74 - text_length
    end
    puts '| ' + line + ' ' * padding + ' |'
  end

  puts pipe_line
  puts cross_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Four thousand holes in Blackburn Lancashire. And though the holes were rather small, they had to count them all. Now they know how many holes it takes to fill the Albert Hall.')