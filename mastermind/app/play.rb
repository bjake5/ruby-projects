# frozen_string_literal: true

# Gameplay file

require_relative 'game'
require_relative 'guess'
require_relative 'action_text'

game = Game.new

player = Player.new(false, game)
player.update_name
player.determine_player_role
computer = Player.new(true, game)
computer.determine_computer_role

game.add_players([player, computer])
