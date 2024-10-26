=begin

With the given program, execution continues up until the maximum number of attempts is reached regardless of
any correct guesses.

Line 22 exectutes when the correct number is chosen, but the loop continues until the
break statemnt on line 11 is met, which breaks out of the loop when `attempts` exceeds `max_attempts`.

To resolve this, we can add at break keyword within the `if` clause to break out of the loop when the guess is correct.

Additionally, the recursive method call on line 28 causes a control flow issue. When the guess is incorrect, the
recursive method call allows both the `winning_number` and `attempts` variables to be re-assigned. Because the loop
is already performing the necessary iteration, removing the recursive method call will resolve the error.

=end

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)
