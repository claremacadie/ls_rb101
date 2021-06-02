# tictactoe_model_solution_fe9.rb
# solution for refactoring players make move code.

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

VALID_INPUTS = ['p', 'c', 'r']

def prompt(msg)
  puts msg
end

def joinor(arr)
  joined_arr = arr.join(', ')
  joined_arr.size == 1 ? joined_arr : "#{joined_arr[0..-4]} or #{arr[-1]}"
end

def display_match_info(score)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}."
  puts "Computer is an #{COMPUTER_MARKER}."
  puts "The first player to win 5 games, wins the match."
  puts "The score is Player: #{score[:player]}, Computer: #{score[:computer]}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  | #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  | #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def offense_move(brd)
  result = nil
  WINNING_LINES.each do |line|
    result = find_at_risk_square(line, brd, COMPUTER_MARKER)
    return result if result
  end
  nil
end

def defense_move(brd)
  result = nil
  WINNING_LINES.each do |line|
    result = find_at_risk_square(line, brd, PLAYER_MARKER)
    return result if result
  end
  nil
end

def computer_places_piece!(brd)
  square = offense_move(brd)

  if !square
    square = defense_move(brd)
  end

  if !square
    square = (brd[5] == ' ' ? 5 : empty_squares(brd).sample)
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def decide_who_goes_first
  answer = ''
  loop do
    system('clear')
    prompt("Welcome to Tic Tac Toe.")
    prompt("Let's decide who will go first.")
    prompt("Enter 'p' for player, 'c' for computer, and 'r' for random.")
    answer = gets.chomp
    break if VALID_INPUTS.include?(answer)
    prompt("That was not a valid option, try again.")
  end

  case answer
  when 'p' then 'player'
  when 'c' then 'computer'
  when 'r' then ['player', 'computer'].sample
  end
end

def declare_who_goes_first(string)
  if string == 'computer'
    prompt("I shall go first.")
  else
    prompt("You go first.")
  end
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

# main program
score = { player: 0, computer: 0 }
loop do
  board = initialize_board
  current_player = decide_who_goes_first
  declare_who_goes_first(current_player)
  prompt("Press enter to begin the game.")
  gets

  loop do
    display_match_info(score)
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    display_match_info(score)
    display_board(board)
    prompt "#{detect_winner(board)} won!"
    score[detect_winner(board).downcase.to_sym] += 1
  else
    prompt "It's a tie!"
  end

  prompt "The score is Player: #{score[:player]}, Computer: #{score[:computer]}"
  prompt "Press return to continue."
  gets

  break if score.values.include?(5)
end

prompt "#{score.key(5).to_s.capitalize} won the match!"
prompt "Thanks for playing Tic Tac Toe. Goodbye."
