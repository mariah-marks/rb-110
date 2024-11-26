require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
FACECARDS = %w(J Q K A).freeze
CARD_VALUES = ('2'..'10').to_a.freeze
SUITS = %w(♥ ♦ ♣ ♠).freeze
WINNING_MAXIMUM = 21
DEALER_MINIMUM = 17

def prompt(key, hash = {})
  message = hash.empty? ? MESSAGES[key] : format(MESSAGES[key], hash)
  puts message
end

def display_rules
  prompt('rules')
  gets.chomp
  system 'clear'
end

def new_deck
  SUITS.each_with_object({}) do |suit, deck|
    deck[suit] = (CARD_VALUES + FACECARDS).shuffle
  end
end

def cards_hash
  [:dealer, :player].each_with_object({}) { |player, hash| hash[player] = [] }
end

def play_again?
  prompt('play_again')
  input = gets.chomp.downcase
  input.start_with?('y')
end

def hit_or_stay
  loop do
    prompt('hit_or_stay')
    input = gets.chomp.downcase
    value = ['hit', 'stay'].find { |v| input.start_with?(v[0]) }
    break value if !!value

    prompt('invalid_input')
  end
end

def bust?(cards)
  count_cards(cards) > WINNING_MAXIMUM
end

def join(cards, delimiter = ", ", word = " and ")
  return cards.join if cards.flatten.size == 2

  cards = cards.map(&:join)
  case cards.size
  when 2
    cards.join(word)
  else
    "#{cards[0..-2].join(delimiter)}#{word}#{cards[-1]}"
  end
end

def display_score(score_board, round = nil)
  if !!round
    prompt('round_score', dealer: score_board[:dealer], \
                          player: score_board[:player], \
                          round: round)
  else
    prompt('total_wins', dealer: score_board[:dealer], \
                         player: score_board[:player])
  end
end

def display_cards(cards, card_totals, final_round = nil)
  player = join(cards[:player])
  dealer = join(cards[:dealer].first)

  if final_round
    dealer = join(cards[:dealer])
    prompt('all_cards', dealer: dealer, player: player)
  else
    player_total = card_totals[:player]
    prompt('cards', dealer: dealer, player: player, player_total: player_total)
  end
end

def display_draw(cards)
  card = cards[:player].last.join
  prompt('player_draw', card: card)
end

def detect_winner(totals)
  return 'tie' if totals[:dealer] == totals[:player]

  sorted_totals = totals.sort_by { |_, total| -total }
  winner = sorted_totals.find { |_, total| total <= WINNING_MAXIMUM }.first

  winner.to_s.capitalize
end

def display_bust(player)
  case player
  when :dealer then prompt('dealer_bust')
  else
    prompt('player_bust')
  end
end

def display_winner(card_totals)
  winner = detect_winner(card_totals)

  case winner
  when 'tie' then prompt('tie')
  else
    prompt('winner', winner: winner)
  end
end

def display_results(cards, card_totals)
  dealer_total = card_totals[:dealer]
  player_total = card_totals[:player]

  display_cards(cards, card_totals, true)
  prompt('round_total', dealer: dealer_total, player: player_total)
  display_winner(card_totals)
end

def hit(deck, cards, card_totals, player = :player)
  deal!(deck, cards[player], 1)
  update_total!(cards[player], card_totals, player)
end

def player_turn(deck, cards, card_totals)
  loop do
    break display_bust(:player) if bust?(cards[:player])

    display_cards(cards, card_totals)
    break unless hit_or_stay == 'hit'
    hit(deck, cards, card_totals)
    display_draw(cards)
  end
end

def dealer_turn(deck, cards, card_totals)
  loop do
    break if count_cards(cards[:dealer]) >= DEALER_MINIMUM
    hit(deck, cards, card_totals, :dealer)
  end

  display_bust(:dealer) if bust?(cards[:dealer])
end

def deal!(deck, cards, quantity = 1)
  quantity.times do
    suit = SUITS.sample
    card = deck[suit].pop

    cards << [card, suit]
  end
end

def initial_deal!(deck, cards, card_totals)
  cards.each do |player, hand|
    deal!(deck, hand, 2)
    update_total!(hand, card_totals, player)
  end
end

def count_cards(cards)
  sum = 0

  cards.each do |card|
    if CARD_VALUES.include?(card[0])
      sum += card[0].to_i
    elsif card[0] == "A"
      ace = sum + 11 > WINNING_MAXIMUM ? 1 : 11
      sum += ace
    else
      sum += 10
    end
  end

  sum
end

def update_total!(cards, card_totals, player)
  card_totals[player] = count_cards(cards)
end

def update_score_board!(score_board, winner)
  score_board[winner.downcase.to_sym] += 1 unless winner == 'tie'
end

def five_wins?(score_board)
  score_board.any? { |_, score| score == 5 }
end

def display_grand_winner(score_board)
  winner = score_board.max_by { |_, score| score }.first.capitalize
  prompt('grand_winner', winner: winner)
end

def next_round
  prompt('next_round')
  gets.chomp
end

system 'clear'
display_rules

loop do
  score_board = { dealer: 0, player: 0 }
  round = 1

  loop do
    system 'clear'
    deck = new_deck
    card_totals = { dealer: 0, player: 0 }
    cards = cards_hash

    initial_deal!(deck, cards, card_totals)
    display_score(score_board, round)
    player_turn(deck, cards, card_totals)
    dealer_turn(deck, cards, card_totals) unless bust?(cards[:player])

    display_results(cards, card_totals)
    next_round
    update_score_board!(score_board, detect_winner(card_totals))
    break if five_wins?(score_board)
    round += 1
  end

  system 'clear'
  display_score(score_board)
  display_grand_winner(score_board)
  break unless play_again?
end

prompt('thanks')
