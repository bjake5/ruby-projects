# frozen_string_literal: true

# Gameplay file

require_relative 'game'
require_relative 'guess'
require_relative 'action_text'
# Create a new game
game = Game.new

# Create a human player and computer player
player = Player.new(false, game)
computer = Player.new(true, game)

# Add the players to the game
game.add_players([player, computer])

# Play the game
game.play
