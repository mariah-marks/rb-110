require 'yaml'

MESSAGES = YAML.load_file('tictactoe_messages.yml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontals
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # verticals
                 [1, 5, 9], [3, 5, 7]] # diagonals

PLAYER_MARKERS = { 'Computer' => 'o', 'Player' => 'x' }
INITIAL_MARKER = ' '

def prompt(key, hash = {})
  message = hash.empty? ? MESSAGES[key] : format(MESSAGES[key], hash)
  puts message
end

def display_welcome
  system 'clear'
  prompt('welcome')
end

def display_greeting(name)
  system 'clear'
  prompt('greeting', name: name)
end

def display_rules
  prompt('rules')
end

def display_start
  prompt('start')
  gets.chomp
end

def get_name
  loop do
    name = gets.chomp.strip
    unless name.empty?
      break name.capitalize
    end
    prompt('invalid_name')
  end
end

def get_first_player
  system 'clear'
  prompt('choose_first')
  choice = gets.chomp.upcase
  players = PLAYER_MARKERS.keys
  first_player = players.find { |player, _| player.start_with?(choice) }
  !!first_player ? first_player : players.sample
end

def new_board
  (1..9).each_with_object({}) { |key, board| board[key] = INITIAL_MARKER }
end

# rubocop: disable Metrics/AbcSize
def display_board(scores, board)
  system 'clear'
  display_scores(scores)
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def open_squares(board)
  board.select { |_, value| value == INITIAL_MARKER }.keys
end

def get_player_choice(board)
  open_squares = open_squares(board)

  loop do
    prompt('player_choice', open_squares: joinor(open_squares))
    choice = gets.chomp
    return choice if open_squares.include?(choice.to_i)
    prompt('invalid_choice')
  end
end

def joinor(squares, delimiter = ", ", word = "or")
  case squares.size
  when 0 then ""
  when 1 then squares[0].to_s
  when 2 then squares.insert(1, word).join(" ")
  else
    "#{squares[0..-2].join(delimiter)} #{word} #{squares[-1]}"
  end
end

def place_piece!(board, current_player)
  move = case current_player
         when "Player" then get_player_choice(board)
         else
           computer_choice(board)
         end

  board[move.to_i] = PLAYER_MARKERS[current_player]
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def middle_square?(board)
  board[5] == INITIAL_MARKER
end

def marker_count(board, line, marker)
  board.values_at(*line).count(marker)
end

def two_in_combination(board)
  open_squares = open_squares(board)
  result = nil

  PLAYER_MARKERS.each_value do |marker|
    WINNING_LINES.each do |line|
      if marker_count(board, line, marker) == 2
        result = line.find { |square| open_squares.include?(square) }
        return result if !!result
      end
    end
  end

  result
end

def next_best(board)
  open_squares = open_squares(board)
  result = nil

  WINNING_LINES.each do |line|
    case marker_count(board, line, PLAYER_MARKERS['Computer'])
    when 1 && marker_count(board, line, PLAYER_MARKERS['Player']).zero?
      result = line.find { |square| open_squares.include?(square) }
      return result if !!result
    end
  end

  result
end

def computer_choice(board)
  computer_choice = middle_square?(board) ? 5 : open_squares(board).sample
  if !!two_in_combination(board)
    computer_choice = two_in_combination(board)
  elsif !!next_best(board)
    computer_choice = next_best(board)
  end

  computer_choice
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    PLAYER_MARKERS.each do |player, marker|
      return player if marker_count(board, line, marker) == 3
    end
  end

  nil
end

def update_scores!(scores, winner)
  scores[winner] += 1 if !!winner
end

def board_full?(board)
  board.all? { |square, _| board[square] != INITIAL_MARKER }
end

def five_wins?(scores)
  scores.any? { |_, score| score == 5 }
end

def display_scores(scores, message = 'current_score')
  prompt(message, player: scores["Player"], computer: scores["Computer"])
end

def display_winner(message_key, winner)
  if !!winner
    prompt(message_key, winner: winner)
  else
    prompt("tie")
  end
end

def get_grand_winner(scores)
  scores.key(5)
end

def play_again?
  prompt('play_again')
  input = gets.chomp.downcase
  input.include?("y")
end

display_welcome
name = get_name
board = new_board
display_greeting(name)
display_rules
display_start

loop do # Main loop
  first_player = get_first_player
  system 'clear'
  scores = { "Player" => 0, "Computer" => 0 }

  until five_wins?(scores) # Match loop
    board = new_board
    current_player = first_player

    loop do
      display_board(scores, board)
      sleep 0.25
      place_piece!(board, current_player)
      display_board(scores, board)
      current_player = alternate_player(current_player)
      break if !!detect_winner(board) || board_full?(board)
    end

    display_board(scores, board)
    round_winner = detect_winner(board)
    update_scores!(scores, round_winner)
    display_winner('round_winner', round_winner)
    sleep 1.25
  end

  system 'clear'
  display_scores(scores, 'final_score')
  display_winner('grand_winner', get_grand_winner(scores))
  break unless play_again?
end

prompt('goodbye', name: name)
