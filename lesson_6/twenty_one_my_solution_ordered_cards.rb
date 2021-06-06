# twenty_one.rb

require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

HEART = "\u2665"
CLUB = "\u2663"
DIAMOND = "\u2666"
SPADE = "\u2660"

CARD_SUITS = [HEART, CLUB, DIAMOND, SPADE]
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 1
}

BUST_VALUE = 21
DEALER_STICK_VALUE = 17
GAME_TARGET = 5
ACE_VALUE_ALTERNATE = 10
ACE_VALUE_LIMIT = 11

VALID_INPUTS = %w(h s)
VALID_ANSWERS = %w(y n)

def prompt(message)
  puts("=> #{message}")
end

def joinor(arr, delimiter=', ', word='and')
  new_arr = arr.clone
  case new_arr.size
  when 0 then ''
  when 1 then new_arr.first
  when 2 then new_arr.join(" #{word} ")
  else
    new_arr[-1] = "#{word} #{new_arr.last}"
    new_arr.join(delimiter)
  end
end

def pronoun(participant)
  participant == 'player' ? 'You' : 'I'
end

def initialize_deck
  cards = CARD_SUITS.each_with_object([]) do |suit, arr|
    CARD_VALUES.keys.each do |value|
      arr << "#{value} #{suit}"
    end
  end
  cards.shuffle
end

def deal_card!(cards, participant, hands)
  hands[participant] << cards.pop
end

def rank(card)
  card.split(' ')[0]
end

def hand_value(hands, participant)
  hand = hands.fetch(participant)
  value = 0
  aces = hand.each_with_object([]) do |card, arr|
    arr << 'Ace' if rank(card) == 'Ace'
    value += CARD_VALUES.fetch(rank(card))
  end
  aces.each { value += ACE_VALUE_ALTERNATE if value <= ACE_VALUE_LIMIT }
  value
end

def deal_initial_cards!(cards, hands)
  2.times { deal_card!(cards, 'player', hands) }
  2.times { deal_card!(cards, 'dealer', hands) }
end

def display_hand(hands, participant)
  hand = hands.fetch(participant)
  prompt("#{pronoun(participant)} have: #{joinor(hand)}, "\
    "for a total of #{hand_value(hands, participant)}.")
end

def display_initial_hands(hands)
  dealer_hand = hands.fetch('dealer')
  prompt("I have: #{dealer_hand[0]} and an unknown card.")
  display_hand(hands, 'player')
end

def ask_player_hit_or_stay
  loop do
    prompt(MESSAGES['ask_hit_or_stay'])
    answer = gets.chomp.downcase.strip
    return answer if VALID_INPUTS.include?(answer)
    prompt(MESSAGES['invalid_choice'])
  end
end

def busted?(hands, participant)
  hand_value(hands, participant) > BUST_VALUE
end

def player_turn!(cards, hands)
  loop do
    hit_or_stay = ask_player_hit_or_stay
    if hit_or_stay == 'h'
      prompt(MESSAGES['player_chose_hit'])
      deal_card!(cards, 'player', hands)
      display_hand(hands, 'player')
    elsif hit_or_stay == 's'
      prompt("You stayed at #{hand_value(hands, 'player')}.")
      return
    end
    break if busted?(hands, 'player')
  end
  prompt(MESSAGES['player_bust'])
end

def dealer_turn!(cards, hands)
  prompt(MESSAGES['spacer_-'])
  prompt(MESSAGES['dealer_turn'])
  display_hand(hands, 'dealer')
  while hand_value(hands, 'dealer') < DEALER_STICK_VALUE
    deal_card!(cards, 'dealer', hands)
    prompt(MESSAGES['dealer_hits'])
    display_hand(hands, 'dealer')
  end

  if busted?(hands, 'dealer')
    prompt(MESSAGES['dealer_bust'])
  else
    prompt("I stayed at #{hand_value(hands, 'dealer')}.")
  end
end

def display_final_hands(hands)
  prompt(MESSAGES['spacer_='])
  ['dealer', 'player'].each do |participant|
    hand = hands.fetch(participant)
    prompt("#{participant.capitalize} has: #{joinor(hand)}, "\
      "for a total of #{hand_value(hands, participant)}.")
  end
  prompt(MESSAGES['spacer_='])
end

def determine_winner(hands)
  if busted?(hands, 'dealer') then 'player'
  elsif busted?(hands, 'player') then 'dealer'
  elsif hand_value(hands, 'player') > hand_value(hands, 'dealer') then 'player'
  elsif hand_value(hands, 'dealer') > hand_value(hands, 'player') then 'dealer'
  else
    'tie'
  end
end

def declare_winner(participant)
  case participant
  when 'player' then prompt(MESSAGES['player_win'])
  when 'dealer' then prompt(MESSAGES['dealer_win'])
  when 'tie' then prompt(MESSAGES['tie'])
  end
end

def play_again?(game_or_match)
  answer = ''
  loop do
    prompt(MESSAGES['spacer_-'])
    if game_or_match == 'game'
      prompt(MESSAGES['ask_another_game?'])
    else
      prompt(MESSAGES['ask_another_match?'])
    end
    answer = gets.chomp.downcase.strip
    break if VALID_ANSWERS.include?(answer)
    prompt(MESSAGES['invalid_answer'])
  end
  answer == 'y'
end

def update_score!(score, winner)
  winner == 'tie' ? return : score[winner.to_sym] += 1
end

def display_score(score)
  prompt("Score: Player = #{score[:player]}, Dealer = #{score[:dealer]}.")
end

def display_champion(score)
  prompt(MESSAGES['spacer_='])
  champion = score.key(GAME_TARGET)
  prompt("#{champion.to_s.upcase} is the CHAMPION!")
end

def clear_screen
  system('clear')
end

# main program
clear_screen
prompt(MESSAGES['welcome'])
gets
score = { player: 0, dealer: 0 }

loop do
  clear_screen
  prompt("You are playing Twenty One! " \
    "First to win #{GAME_TARGET} games is the champion!")
  display_score(score)
  prompt(MESSAGES['spacer_-'])
  cards = initialize_deck
  hands = { 'player' => [], 'dealer' => [] }
  deal_initial_cards!(cards, hands)
  display_initial_hands(hands)

  player_turn!(cards, hands)
  if !busted?(hands, 'player')
    dealer_turn!(cards, hands)
  end

  display_final_hands(hands)
  winner = determine_winner(hands)
  declare_winner(winner)
  update_score!(score, winner)
  display_score(score)

  if score.values.any?(GAME_TARGET)
    display_champion(score) if score.values.any?(GAME_TARGET)
    score = { player: 0, dealer: 0 }
    break unless play_again?('match')
  else
    break unless play_again?('game')
  end
end

prompt(MESSAGES['goodbye'])
