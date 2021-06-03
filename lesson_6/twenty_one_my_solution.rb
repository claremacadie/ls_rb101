# twenty_one.rb

CARD_SUITS = [:hearts, :clubs, :diamonds, :spades]
CARD_RANKS = [
  'Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King'
]
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 1
}

TEN_VALUE_CARDS = ['Jack', 'Queen', 'King']

VALID_INPUTS = ['h', 's']
VALID_ANSWERS = ['y', 'n']

require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def pronoun(participant)
  if participant == 'player'
    'You'
  elsif participant == 'dealer'
    'I'
  end
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
    aces << 'Ace' if rank == 'Ace'
    value += CARD_VALUES.fetch(rank)
  end

  aces.each { value += 10 if value <= 11 }
  value
end

def deal_initial_cards!(cards)
  2.times { deal_card!(cards, 'player') }
  2.times { deal_card!(cards, 'dealer') }
end

def declare_initial_dealer_card_values(cards)
  dealer_cards = card_locations(cards, 'dealer')
  first_dealer_card = dealer_cards[0].split('_')[0]
  prompt("#{pronoun('dealer')} have: #{first_dealer_card} and unknown card.")
end

def declare_prior_dealer_card_values(cards)
  dealer_hand = card_locations(cards, 'dealer')
  dealer_hand_without_suits = dealer_hand.each_with_object([]) do |card, arr|
    arr << card.split('_')[0]
  end
  prompt("I have: #{joinor(dealer_hand_without_suits)}, "\
    "for a total of #{hand_value(cards, 'dealer')}.")
end

def joinor(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def declare_initial_player_card_values(cards)
  hand = card_locations(cards, 'player')
  hand_without_suits = hand.each_with_object([]) do |card, arr|
    arr << card.split('_')[0]
  end
  prompt("#{pronoun('player')} have: #{joinor(hand_without_suits)}, "\
    "for a total of #{hand_value(cards, 'player')}.")
end

def declare_participant_card_values(cards, participant)
  hand = card_locations(cards, participant)
  hand_without_suits = hand.each_with_object([]) do |card, arr|
    arr << card.split('_')[0]
  end
  prompt("#{pronoun(participant)} now have: #{joinor(hand_without_suits)}, "\
    "for a total of #{hand_value(cards, participant)}.")
end

def declare_final_participant_card_values(cards, participant)
  hand = card_locations(cards, participant)
  hand_without_suits = hand.each_with_object([]) do |card, arr|
    arr << card.split('_')[0]
  end
  prompt("#{participant.capitalize} has: #{joinor(hand_without_suits)}, "\
    "for a total of #{hand_value(cards, participant)}.")
end

def ask_player_hit_or_stay
  loop do
    prompt(MESSAGES['ask_hit_or_stay'])
    answer = gets.chomp
    return answer if VALID_INPUTS.include?(answer)
    prompt(MESSAGES['invalid_choice'])
  end
end

def busted?(cards, participant)
  hand_value(cards, participant) > 21
end

def player_turn!(cards)
  declare_initial_dealer_card_values(cards)
  declare_initial_player_card_values(cards)
  loop do
    hit_or_stay = ask_player_hit_or_stay
    if hit_or_stay == 'h'
      prompt(MESSAGES['player_chose_hit'])
      deal_card!(cards, 'player')
      declare_participant_card_values(cards, 'player')
    elsif hit_or_stay == 's'
      prompt("You stayed at #{hand_value(cards, 'player')}")
    end
    return if hit_or_stay == 's' || busted?(cards, 'player')
  end
end

def dealer_turn!(cards)
  prompt(MESSAGES['dealer_turn'])
  declare_prior_dealer_card_values(cards)
  loop do
    if hand_value(cards, 'dealer') < 17
      deal_card!(cards, 'dealer')
      prompt(MESSAGES['dealer_hits'])
      declare_participant_card_values(cards, 'dealer')
    elsif busted?(cards, 'dealer')
      return
    else
      prompt("Dealer stays at #{hand_value(cards, 'dealer')}")
      return
    end
  end
end

def declare_winner(cards)
  if busted?(cards, 'player')
    prompt(MESSAGES['player_bust'])
  elsif busted?(cards, 'dealer')
    prompt(MESSAGES['dealer_bust'])
  elsif hand_value(cards, 'player') > hand_value(cards, 'dealer')
    prompt(MESSAGES['spacer_='])
    declare_final_participant_card_values(cards, 'dealer')
    declare_final_participant_card_values(cards, 'player')
    prompt(MESSAGES['spacer_='])
    prompt(MESSAGES['player_win'])
  elsif hand_value(cards, 'dealer') > hand_value(cards, 'player')
    prompt(MESSAGES['spacer_='])
    declare_final_participant_card_values(cards, 'dealer')
    declare_final_participant_card_values(cards, 'player')
    prompt(MESSAGES['spacer_='])
    prompt(MESSAGES['dealer_win'])
  else
    declare_final_participant_card_values(cards, 'dealer')
    declare_final_participant_card_values(cards, 'player')
    prompt(MESSAGES['tie'])
  end
end

def another_game?
  answer = ''
  loop do
    prompt(MESSAGES['spacer_-'])
    prompt(MESSAGES['ask_another_game?'])
    answer = gets.chomp
    break if VALID_ANSWERS.include?(answer)
    prompt(MESSAGES['invalid_answer'])
  end
  answer == 'y'
end

# main program
loop do
  system('clear')
  prompt(MESSAGES['welcome'])
  cards = initialize_deck!
  deal_initial_cards!(cards)
  player_turn!(cards)
  if !busted?(cards, 'player')
    dealer_turn!(cards)
  end

  declare_winner(cards)
  break if !another_game?
end
prompt(MESSAGES['goodbye'])
