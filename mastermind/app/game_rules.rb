# frozen_string_literal: true

require_relative 'game_board'
require_relative 'player'
require_relative 'guess'

# This is a GameRules class to organize the basic rules of the game, including the roles, available colors, and guesses.
class GameRules
  include ActionText

  attr_accessor :code_maker, :code_guesser, :guess_number, :guesses_remaining, :roles_available, :colors_available,
                :colors_in_code

  def initialize(game)
    @game = game
    @code_maker = nil
    @code_guessor = nil
    @guess_number = 1
    @guesses_remaining = 12
    @roles_available = %w[CODE_MAKER CODE_GUESSER]
    @colors_available = %w[blue green orange purple red yellow]
    @colors_in_code = 4
  end

  def claim_role(role)
    index = @roles_available.index(role)
    @roles_available.delete_at(index)
  end
end
