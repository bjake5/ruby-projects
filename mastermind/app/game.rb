# frozen_string_literal: true

require_relative 'action_text'
require_relative 'game_board'
require_relative 'game_rules'

class Game
  include ActionText

  attr_accessor :game_board, :game_rules, :players, :won

  def initialize
    @game_board = GameBoard.new(self)
    @game_rules = GameRules.new(self)
    @players = nil
    @won = false
  end

  def play
    if @game_rules.code_maker.is_computer == true
      setup_computer_code_maker
    elsif @game_rules.code_maker.is_computer == false
      setup_player_code_maker
    else
      raise 'no code maker setup!!'
    end
  end

  def setup_computer_code_maker
    @game_board.generate_code
    while @won == false || game_rules.guesses_remaining.zero?
      @game_board.display_guess_info_text
      @game_board.get_player_guess
      @game_board.check_guess_against_code
      @game_board.determine_code_broken
      @game_board.reset_guess
    end
    if @won == true
      puts 'You win!'
    elsif game_rules.guesses_remaining.zero?
      puts 'You lost!'
    else
      raise 'error!'
    end
  end

  def add_players(players)
    @players = players
  end
end
