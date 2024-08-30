# Basic gameplay is organized here

# Require relatives here
require_relative "app/player"
require_relative "app/game"

# Get user input to populate player names
puts "\nHow many players?"
puts "2 players"
number_of_players = 2
players = []
id = 1
while id <= number_of_players
  puts "\nPlayer #{id}: Enter your name!"
  player_name = gets.chomp
  puts "\nPlayer #{id}: Enter your symbol!"
  player_symbol = gets.chomp
  player = Player.new(player_name, player_symbol)
  players.push(player)
  id += 1
end

# Create game board
game = Game.new(players)

# Play game
game.play_game
