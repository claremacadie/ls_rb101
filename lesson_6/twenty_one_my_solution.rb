# twenty_one.rb

require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

CARD_SUITS = ['H', 'C', 'D', 'S']
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 1
}

BUST_VALUE = 21
DEALER_STICK_VALUE = 17

VALID_INPUTS = ['h', 's']
VALID_ANSWERS = ['y', 'n']

def prompt(message)
  puts("=> #{message}")
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

def pronoun(participant)
  participant == 'player' ? 'You' : 'I'
end

def initialize_deck!
  result = CARD_SUITS.each_with_object({}) do |suit, hsh|
    CARD_VALUES.keys.each do |value|
      card = "#{value}_#{suit}"
      hsh[card] = '-'
    end
  end
  result
end

def filter(cards, participant)
  cards.select { |_, v| v == participant }.keys
end

def deal_card!(cards, participant)
  deck = filter(cards, '-')
  card = deck.sample
  cards[card] = participant
end

def rank(card)
  card.split('_')[0]
end

def hand_value(cards, participant)
  hand = filter(cards, participant)
  value = 0
  aces = hand.each_with_object([]) do |card, arr|
    arr << 'Ace' if rank(card) == 'Ace'
    value += CARD_VALUES.fetch(rank(card))
  end
  aces.each { value += 10 if value <= 11 }
  value
end

def deal_initial_cards!(cards)
  2.times { deal_card!(cards, 'player') }
  2.times { deal_card!(cards, 'dealer') }
end

def display_hand(cards, participant)
  hand = filter(cards, participant)
  prompt("#{pronoun(participant)} have: #{joinor(hand)}, "\
    "for a total of #{hand_value(cards, participant)}.")
end

def display_initial_hands(cards)
  dealer_hand = filter(cards, 'dealer')
  prompt("I have: #{dealer_hand[0]} and unknown card.")
  display_hand(cards, 'player')
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
  hand_value(cards, participant) > BUST_VALUE
end

def player_turn!(cards)
  loop do
    hit_or_stay = ask_player_hit_or_stay
    if hit_or_stay == 'h'
      prompt(MESSAGES['player_chose_hit'])
      deal_card!(cards, 'player')
      display_hand(cards, 'player')
    elsif hit_or_stay == 's'
      prompt("You stayed at #{hand_value(cards, 'player')}.")
    end
    return if hit_or_stay == 's' || busted?(cards, 'player')
  end
end

def dealer_turn!(cards)
  prompt(MESSAGES['dealer_turn'])
  display_hand(cards, 'dealer')
  while hand_value(cards, 'dealer') < DEALER_STICK_VALUE
    deal_card!(cards, 'dealer')
    prompt(MESSAGES['dealer_hits'])
    display_hand(cards, 'dealer')
  end
end

def display_final_hands(cards)
  prompt(MESSAGES['spacer_='])
  ['dealer', 'player'].each do |participant|
    hand = filter(cards, participant)
    prompt("#{participant.capitalize} has: #{joinor(hand)}, "\
      "for a total of #{hand_value(cards, participant)}.")
  end
  prompt(MESSAGES['spacer_='])
end

def declare_winner(cards)
  if hand_value(cards, 'player') > hand_value(cards, 'dealer')
    prompt(MESSAGES['player_win'])
  elsif hand_value(cards, 'dealer') > hand_value(cards, 'player')
    prompt(MESSAGES['dealer_win'])
  else
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
  display_initial_hands(cards)

  player_turn!(cards)
  if busted?(cards, 'player')
    prompt(MESSAGES['spacer_-'])
    prompt(MESSAGES['player_bust'])
    another_game? ? next : break
  end

  dealer_turn!(cards)
  if busted?(cards, 'dealer')
    prompt(MESSAGES['spacer_-'])
    prompt(MESSAGES['dealer_bust'])
    another_game? ? next : break
  else
    prompt("I stayed at #{hand_value(cards, 'dealer')}.")
  end

  display_final_hands(cards)
  declare_winner(cards)
  another_game? ? next : break
end
prompt(MESSAGES['goodbye'])
