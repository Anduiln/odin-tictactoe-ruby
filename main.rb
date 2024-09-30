require_relative "players"
require_relative "game"

# Prompt for player names (create object for players)
players = Players.new

# Create grid and print it
game = Game.new
game.print_grid

# Set up variables for loop
winner = nil
current_player = "x"

# Play until winner is determined, or break at turn 9 end 
until winner or game.turn >= 9
  if current_player == "x"
    puts "#{players.crosses}'s move:"
  else
    puts "#{players.noughts}'s move:"
  end
  
  # Check if move is valid and play, or keep reprompting user for move
  while true
    move = gets.chomp

    # Check format of move is valid
    if move.length == 2 and move.match(/[a-zA-Z][1-3]/)
      move.capitalize!
      
      # Check play is valid
      if game.new_turn(current_player, move) 
        break
      else
        puts "Impossible move. Try again:"
      end
    else
      puts "Must be in the format \"B2\". Try again:"
    end
  end

  game.print_grid

  winner = current_player if game.has_won?(current_player)
  current_player == "x" ? current_player = "o" : current_player = "x"
end

if winner == "x"
  puts "#{players.crosses} wins!"
elsif winner == "o"
  puts "#{players.noughts} wins!"
else
  puts "It's a tie, predictably."
end

# Loop prompts for each player's play coordinates, starting with player X
  # if player coordinates are already filled, print alert and reprompt
  # else print grid again, with X or O in the appropriate location
    # if line, column or diagonal is all Xs or Os, declare winner
    # else if grid is filled, declare draw
    # else continue with next player
