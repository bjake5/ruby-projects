# frozen_string_literal: true

# Gameplay file

require_relative 'game'
require_relative 'guess'
require_relative 'action_text'

game = Game.new

player = Player.new(false, game)
computer = Player.new(true, game)

game.add_players([player, computer])
game.play
