# frozen_string_literal: true

require_relative 'game_rules'
require_relative 'player'
require_relative 'guess'

class GameBoard
  include ActionText

  attr_accessor :game

  def initialize(game)
    @game = game
    @code = []
    @prior_guesses = []
    @last_code_guess = []
    @guess_feedback = []
  end

  def generate_code
    available_colors = game.game_rules.colors_available.clone
    i = 0
    while i < game.game_rules.colors_in_code
      color_index = rand(0..available_colors.length - 1)
      @code << available_colors[color_index]
      available_colors.delete_at(color_index)
      i += 1
    end
  end

  def display_guess_info_text
    puts horizontal_line
    puts guess_info_text(game.game_rules.guess_number, game.game_rules.guesses_remaining)
  end

  def display_guess_player_prompt
    puts guess_player_prompt(@last_code_guess.length + 1,
                             game.game_rules.colors_in_code - (@last_code_guess.length + 1))
    i = 1
    @prior_guesses.each do |guess|
      puts "Guess ##{i}: #{guess}"
      i += 1
    end
  end

  def display_current_guess_info_text
    puts current_guess_info_text(@last_code_guess)
  end

  def display_remaining_colors(_colors)
    puts current_remaining_guess_colors(_colors)
  end

  def display_current_guess_feedback_text
    puts current_guess_feedback_text(@guess_feedback)
  end

  def get_player_guess
    @last_code_guess = []
    available_colors_to_guess = game.game_rules.colors_available.clone
    while @last_code_guess.length < game.game_rules.colors_in_code
      puts horizontal_line
      display_guess_player_prompt
      display_remaining_colors(available_colors_to_guess)
      code_section_guess = gets.chomp
      code_guess_index = available_colors_to_guess.find_index(code_section_guess)
      next unless available_colors_to_guess.include?(code_section_guess)

      @last_code_guess << code_section_guess
      available_colors_to_guess.delete_at(code_guess_index)
      display_current_guess_info_text
    end
  end

  def check_guess_against_code
    i = 0
    @last_code_guess.each do |guess|
      @guess_feedback << if guess == @code[i]
                           'red'
                         elsif @code.include?(guess)
                           'white'
                         end
      i += 1
    end
    @guess_feedback = @guess_feedback.compact
    p display_current_guess_feedback_text
  end

  def determine_code_broken
    if @guess_feedback.length == game.game_rules.colors_in_code && @guess_feedback.all? { |element| element == 'red' }
      game.won = true
    end
  end

  def reset_guess
    @prior_guesses << [@last_code_guess, @guess_feedback]
    @last_code_guess = []
    @guess_feedback = []
    game.game_rules.guess_number += 1
    game.game_rules.guesses_remaining -= 1
  end
end
