=begin

In the block on lines 29..35, a new array is returned by the map method. Because this method isn't mutating, and
the return value of the `map` invocation isn't assigned to another variable, the `sum` method is called on an array
containing symbols and integers.

We can resolve this by setting the return value from the `map` method call on line 30 to a new variable `scores`.

Additionally, the mutating method calls on lines 23 and 24 are shuffle and remove the last card from every suit, because
each suit in the deck references the same array object. This can be resolved by setting each value in our `deck` hash to
a copy of the `cards` array.

=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop

end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  score = remaining_cards.map { |card| score(card) }
  sum += score.sum
end

total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum

puts sum
p ((sum == total_sum - player_sum) == true)
