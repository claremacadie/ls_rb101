# tictactoe.rb

require 'yaml'
MESSAGES = YAML.load_file('tictactoe.yml')

def prompt(message)
  puts(">> #{message}")
end

def display_board(brd)
  system('clear')
  puts
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts "-----------"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts "-----------"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def valid_move?(player_position, board)
  if player_position.to_i.to_s != player_position ||
     (1..9).include?(player_position.to_i) == false ||
     player_position.include?('.')
    prompt(MESSAGES['invalid_input'])
    false
  elsif board[player_position.to_i] != ' '
    prompt(MESSAGES['invalid_turn'])
    false
  else
    true
  end
end

def player_turn(board)
  loop do
    prompt(MESSAGES['player_turn'])
    player_position = gets.chomp
    return player_position if valid_move?(player_position, board)
  end
end

def computer_turn(board)
  sleep(1)
  prompt(MESSAGES['thinking_pause'])
  sleep(1)
  available_moves = []
  board.each { |k, v| available_moves << k if v == ' ' }
  available_moves.sample
end

def three_in_a_row?(a, b, c)
  a != ' ' && a == b && b == c
end

def check_winner(hsh)
  winning_arrays = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  winning_arrays.each do |arr|
    result = three_in_a_row?(hsh[arr[0]], hsh[arr[1]], hsh[arr[2]])
    return hsh[arr[0]] if result
  end

  return 'tie' if hsh.values.count(' ') == 0
end

def declare_winner(winner)
  sleep(0.5)
  case winner
  when 'X'   then prompt(MESSAGES['player_wins'])
  when 'O'   then prompt(MESSAGES['computer_wins'])
  when 'tie' then prompt(MESSAGES['tie'])
  end
  puts
end

# main program
system('clear')
prompt(MESSAGES['welcome'])
winner = false

loop do
  board = initialize_board
  display_board(board)

  loop do
    player_position = player_turn(board)
    board[player_position.to_i] = 'X'
    display_board(board)
    winner = check_winner(board)
    break if winner

    computer_position = computer_turn(board)
    board[computer_position.to_i] = 'O'
    display_board(board)
    winner = check_winner(board)
    break if winner

    break if board.values.any?(' ') == false
  end

  declare_winner(winner)

  prompt(MESSAGES['play_again?'])
  prompt(MESSAGES['instruction'])
  answer = gets.chomp
  break unless answer == 'y'
  system('clear')
end

system('clear')
prompt(MESSAGES['goodbye'])
puts
