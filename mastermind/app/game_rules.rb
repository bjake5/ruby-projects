# frozen_string_literal: true

require_relative 'game_board'
require_relative 'player'
require_relative 'guess'

class GameRules
  include ActionText

  attr_accessor :code_maker, :code_guesser, :guesses_remaining, :roles_available

  def initialize
    @code_maker = nil
    @code_guessor = nil
    @guesses_remaining = 12
    @roles_available = %w[CODE_MAKER CODE_GUESSER]
  end

  def claim_role(role)
    index = @roles_available.index(role)
    @roles_available.delete_at(index)
  end
end
