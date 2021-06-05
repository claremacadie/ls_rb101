SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

STAY_LIMIT = 17
BUST_LIMIT = 21
GAME_LIMIT = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > BUST_LIMIT
  end

  sum
end

def busted?(cards)
  total(cards) > BUST_LIMIT
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > BUST_LIMIT
    :player_busted
  elsif dealer_total > BUST_LIMIT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_cards(dealer_cards, player_cards, dealer_total, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

def display_result(dealer_cards, player_cards, score)
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
  prompt "The score is: Player = #{score[0]}, Dealer = #{score[1]}."
end

def update_score!(dealer_cards, player_cards, score)
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted
    score[1] += 1
  when :dealer_busted
    score[0] += 1
  when :player
    score[0] += 1
  when :dealer
    score[1] += 1
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

score = [0, 0]
loop do
  prompt "Welcome to Twenty-One! First to 5 wins will be the champion."

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, "\
    "for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_cards(dealer_cards, player_cards, dealer_total, player_total)
    update_score!(dealer_cards, player_cards, score)
    display_result(dealer_cards, player_cards, score)
    break if score.include?(GAME_LIMIT)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= STAY_LIMIT

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_cards(dealer_cards, player_cards, dealer_total, player_total)
    update_score!(dealer_cards, player_cards, score)
    display_result(dealer_cards, player_cards, score)
    break if score.include?(GAME_LIMIT)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  display_cards(dealer_cards, player_cards, dealer_total, player_total)

  update_score!(dealer_cards, player_cards, score)
  display_result(dealer_cards, player_cards, score)

  break unless score.include?(GAME_LIMIT) || play_again?
end

if score.include?(GAME_LIMIT)
  if score[0] == GAME_LIMIT
    prompt("Player is the CHAMPION!")
  else
    prompt("Dealer is the CHAMPION!")
  end
end

prompt "Thank you for playing Twenty-One! Good bye!"
