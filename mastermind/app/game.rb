# frozen_string_literal: true

require_relative 'action_text'
require_relative 'game_board'
require_relative 'game_rules'

# This is the primary Game class to organize the player/computer actions.
# There are separate code paths for player vs. computer code/guess generation, but they reuse many underlying functions.
class Game
  include ActionText

  attr_accessor :game_board, :game_rules, :players, :won

  def initialize
    @game_board = GameBoard.new(self)
    @game_rules = GameRules.new(self)
    @players = nil
    @won = false
  end

  # Primary function to trigger who is the code maker and whether player input is immeditaly necessary.
  def play
    if @game_rules.code_maker.is_computer == true
      setup_computer_code_maker
    elsif @game_rules.code_maker.is_computer == false
      setup_player_code_maker
    else
      raise 'no code maker setup!!'
    end
  end

  # Generate computer code and then run player-led gameplay until game over criteria is hit
  def setup_computer_code_maker
    @game_board.generate_code
    until game_over?
      @game_board.display_guess_info_text
      @game_board.get_player_guess
      @game_board.check_guess_against_code
      @game_board.determine_code_broken
      @game_board.reset_guess
    end
    if @won == true
      puts "#{game_rules.code_guesser.name} win!"
    elsif game_rules.guesses_remaining.zero?
      puts 'Computer wins!'
    else
      raise 'error!'
    end
  end

  # Receive code and then run computer-led gameplay until game over criteria is hit
  def setup_player_code_maker
    @game_board.get_player_code
    until game_over?
      @game_board.generate_guess
      @game_board.check_guess_against_code
      @game_board.determine_code_broken
      @game_board.reset_guess
    end
    if @won == true
      puts 'Computer wins!'
    elsif game_rules.guesses_remaining.zero?
      puts "#{game_rules.code_maker.name} wins!"
    else
      raise 'error!'
    end
  end

  # Game is over when the game is won or there are no remaining guesses
  def game_over?
    @won == true || game_rules.guesses_remaining.zero?
  end

  # Add players to the game after they are created
  def add_players(players)
    @players = players
  end
end
