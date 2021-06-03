# 21_1.rb
# first stab at data structure for the deck, player's and dealer's cards.

CARD_SUITS = [:hearts, :clubs, :diamonds, :spades]
CARD_RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 1
}

VALID_INPUTS = ['h', 's']

require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def initialize_deck!
  result = CARD_SUITS.each_with_object({}) do |suit, hsh|
    CARD_RANKS.each do |value|
      card = "#{value}_#{suit}"
      hsh[card] = '-'
    end
  end
  result
end

def card_locations(cards, participant)
  result = []
  cards.each do |k, v|
    result << k if v == participant
  end
  result
end

def deal_card!(cards, participant)
  result = card_locations(cards, '-').sample
  cards[result] = participant
end

def hand_value(cards, hand)
  cards_in_hand = card_locations(cards, hand)
  value = 0
  aces = []
  cards_in_hand.each do |card|
    rank = card.split('_')[0]
    aces << 'A' if rank == 'A'
    value += CARD_VALUES.fetch(rank)
  end

  aces.each { value += 10 if value <= 11 }
  value
end

def deal_initial_cards!(cards)
  2.times { deal_card!(cards, 'player') }
  2.times { deal_card!(cards, 'dealer') }
end

def ask_player_hit_or_stay
  loop do
    prompt(MESSAGES['ask_hit_or_stay'])
    prompt(MESSAGES['instruction_for_hit_or_stay'])
    answer = gets.chomp
    return answer if VALID_INPUTS.include?(answer)
    prompt(MESSAGES['invalid_choice'])
  end
end

def busted?(cards, participant)
  hand_value(cards, participant) > 21
end

def player_turn!(cards)
  loop do
    prompt("Your cards are: #{card_locations(cards, 'player')}")
    hit_or_stay = ask_player_hit_or_stay
    deal_card!(cards, 'player') if hit_or_stay == 'h'
    return if hit_or_stay == 's' || busted?(cards, 'player')
  end
end

def dealer_turn!(cards)
  loop do
    hand_value(cards, 'dealer') < 17 ? deal_card!(cards, 'dealer') : return
  end
end

def declare_winner(cards)
  case
  when busted?(cards, 'player')
    prompt(MESSAGES['player_bust'])
  when busted?(cards, 'dealer')
    prompt(MESSAGES['dealer_bust'])
  when hand_value(cards, 'player') > hand_value(cards, 'dealer')
    prompt(MESSAGES['player_win'])
  else
    prompt(MESSAGES['dealer_win'])
  end
end

# main program
system('clear')
prompt(MESSAGES['welcome'])
cards = initialize_deck!
deal_initial_cards!(cards)
player_turn!(cards)
dealer_turn!(cards)

p card_locations(cards, 'player')
p card_locations(cards, 'dealer')

declare_winner(cards)
prompt(MESSAGES['goodbye'])
