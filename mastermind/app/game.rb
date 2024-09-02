# frozen_string_literal: true

require_relative 'action_text'
require_relative 'game_board'
require_relative 'game_rules'

class Game
  include ActionText

  attr_accessor :game_board, :game_rules, :players

  def initialize
    @game_board = GameBoard.new
    @game_rules = GameRules.new
    @players = nil
  end

  def play; end

  def add_players(players)
    @players = players
  end
end

# puts computer_role_prompt
#   @computer_role = gets.chomp
#  if @computer_role == "Y"
#   @computer_role = "code_maker"
#  Player.new("Computer", true, true)
# Player.new("Player")
# elsif @computer_role == "N"
# @computer_role == "code_guesser"
# else
# create_player
