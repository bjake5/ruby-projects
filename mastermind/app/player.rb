# frozen_string_literal: true

require_relative 'game'
require_relative 'game_rules'
require_relative 'game_board'
require_relative 'action_text'

# This is a Player class to organize the various player data including name and roles.
class Player
  include ActionText

  attr_accessor :is_computer, :game, :name, :role

  def initialize(is_computer, game)
    @is_computer = is_computer
    @game = game
    @name = nil
    @role = nil
    setup_players
  end

  def setup_players
    if @is_computer == false
      update_name
      determine_player_role
    elsif @is_computer == true
      determine_computer_role
    else
      raise 'error!'
    end
  end

  def update_name
    puts player_name_prompt
    @name = gets.chomp
  end

  def determine_player_role
    puts player_role_prompt(@name)
    puts game.game_rules.roles_available.join(' | ')
    role = gets.chomp
    if game.game_rules.roles_available.include?(role)
      update_role(role)
    else
      determine_player_role
    end
  end

  def determine_computer_role
    @role = game.game_rules.roles_available.first
    update_role(@role)
  end

  def update_role(role)
    if role == 'CODE_MAKER'
      @role =  'CODE_MAKER'
      game.game_rules.code_maker = self
    else
      @role = 'CODE_GUESSER'
      game.game_rules.code_guesser = self
    end
    game.game_rules.claim_role(@role)
  end
end
