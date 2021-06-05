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

def initialize_deck
  result = CARD_SUITS.each_with_object({}) do |suit, hsh|
    CARD_VALUES.keys.each do |value|
      card = "#{value} #{suit}"
      hsh[card] = '-'
    end
  end
  result
end

def get_cards(cards, participant)
  cards.select { |_, v| v == participant }.keys
end

def deal_card!(cards, participant)
  deck = get_cards(cards, '-')
  card = deck.sample
  cards[card] = participant
end

def rank(card)
  card.split(' ')[0]
end

def hand_value(cards, participant)
  hand = get_cards(cards, participant)
  value = 0
  aces = hand.each_with_object([]) do |card, arr|
    arr << 'Ace' if rank(card) == 'Ace'
    value += CARD_VALUES.fetch(rank(card))
  end
  aces.each { value += ACE_VALUE_ALTERNATE if value <= ACE_VALUE_LIMIT }
  value
end

def deal_initial_cards!(cards)
  2.times { deal_card!(cards, 'player') }
  2.times { deal_card!(cards, 'dealer') }
end

def display_hand(cards, participant)
  hand = get_cards(cards, participant)
  prompt("#{pronoun(participant)} have: #{joinor(hand)}, "\
    "for a total of #{hand_value(cards, participant)}.")
end

def display_initial_hands(cards)
  dealer_hand = get_cards(cards, 'dealer')
  prompt("I have: #{dealer_hand[0]} and an unknown card.")
  display_hand(cards, 'player')
end

def ask_player_hit_or_stay
  loop do
    prompt(MESSAGES['ask_hit_or_stay'])
    answer = gets.chomp.strip
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
      return
    end
    break if busted?(cards, 'player')
  end
  prompt(MESSAGES['player_bust'])
end

def dealer_turn!(cards)
  prompt(MESSAGES['spacer_-'])
  prompt(MESSAGES['dealer_turn'])
  display_hand(cards, 'dealer')
  while hand_value(cards, 'dealer') < DEALER_STICK_VALUE
    deal_card!(cards, 'dealer')
    prompt(MESSAGES['dealer_hits'])
    display_hand(cards, 'dealer')
  end

  if busted?(cards, 'dealer')
    prompt(MESSAGES['dealer_bust'])
  else
    prompt("I stayed at #{hand_value(cards, 'dealer')}.")
  end
end

def display_final_hands(cards)
  prompt(MESSAGES['spacer_='])
  ['dealer', 'player'].each do |participant|
    hand = get_cards(cards, participant)
    prompt("#{participant.capitalize} has: #{joinor(hand)}, "\
      "for a total of #{hand_value(cards, participant)}.")
  end
  prompt(MESSAGES['spacer_='])
end

def determine_winner(cards)
  if busted?(cards, 'dealer') then 'player'
  elsif busted?(cards, 'player') then 'dealer'
  elsif hand_value(cards, 'player') > hand_value(cards, 'dealer') then 'player'
  elsif hand_value(cards, 'dealer') > hand_value(cards, 'player') then 'dealer'
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

def another_game?
  answer = ''
  loop do
    prompt(MESSAGES['spacer_-'])
    prompt(MESSAGES['ask_another_game?'])
    answer = gets.chomp.strip
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

# main program
score = { player: 0, dealer: 0 }
system('clear')
prompt(MESSAGES['welcome'])
gets
loop do
  system('clear')
  prompt("You are playing Twenty One! " \
    "First to win #{GAME_TARGET} games is the champion!")
  display_score(score)
  prompt(MESSAGES['spacer_-'])
  cards = initialize_deck
  deal_initial_cards!(cards)
  display_initial_hands(cards)

  player_turn!(cards)
  if !busted?(cards, 'player')
    dealer_turn!(cards)
  end

  display_final_hands(cards)
  winner = determine_winner(cards)
  declare_winner(winner)
  update_score!(score, winner)
  display_score(score)
  break if score.values.any?(GAME_TARGET)
  break unless another_game?
end

display_champion(score) if score.values.any?(GAME_TARGET)
prompt(MESSAGES['goodbye'])
