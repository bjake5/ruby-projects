# frozen_string_literal: true

require_relative 'game_rules'
require_relative 'player'
require_relative 'guess'

# This is a GameBoard class to organize code, current guess, prior guess history, and display information functions.
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

  # Function to generate a code by the computer that fits the current game rules
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

  # Function to generate a code guess by the computer that fits the current game rules
  def generate_guess
    available_colors_to_guess = game.game_rules.colors_available.clone
    while @last_code_guess.length < game.game_rules.colors_in_code
      puts horizontal_line
      display_guess_player_prompt
      display_remaining_colors(available_colors_to_guess)
      computer_guess_color_index = rand(0..available_colors_to_guess.length - 1)
      computer_guess_color = available_colors_to_guess[computer_guess_color_index]
      next unless available_colors_to_guess.include?(computer_guess_color)

      @last_code_guess << computer_guess_color
      available_colors_to_guess.delete_at(computer_guess_color_index)
      display_current_guess_info_text
    end
  end

  # Function to get and validate player code guess
  def get_player_guess
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

  # Function to get and validate player code
  def get_player_code
    available_colors_to_code = game.game_rules.colors_available.clone
    while @code.length < game.game_rules.colors_in_code
      puts horizontal_line
      display_code_player_prompt
      display_remaining_colors(available_colors_to_code)
      code_section = gets.chomp
      code_section_index = available_colors_to_code.find_index(code_section)
      next unless available_colors_to_code.include?(code_section)

      @code << code_section
      available_colors_to_code.delete_at(code_section_index)
      display_current_code_info_text
    end
  end

  # Function to provide feedback on guess using code
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
    puts display_current_guess_feedback_text
  end

  # Function to determine if the code has been broken by the guess
  def determine_code_broken
    if @guess_feedback.length == game.game_rules.colors_in_code && @guess_feedback.all? { |element| element == 'red' }
      game.won = true
    end
  end

  # Function to reset the memorialize the last guess data and prepare for next input
  def reset_guess
    @prior_guesses << [@last_code_guess, @guess_feedback]
    @last_code_guess = []
    @guess_feedback = []
    game.game_rules.guess_number += 1
    game.game_rules.guesses_remaining -= 1
  end

  # Function to display current guess number and how many guesses remaining until game over
  def display_guess_info_text
    puts horizontal_line
    puts guess_info_text(game.game_rules.guess_number, game.game_rules.guesses_remaining)
  end

  # Function to display prior guesses
  def display_guess_player_prompt
    puts guess_player_prompt(@last_code_guess.length + 1,
                             game.game_rules.colors_in_code - (@last_code_guess.length + 1))
    i = 1
    @prior_guesses.each do |guess|
      puts "Guess ##{i}: #{guess}"
      i += 1
    end
  end

  # Function to display prior code
  def display_code_player_prompt
    puts code_player_prompt(@code.length + 1,
                            game.game_rules.colors_in_code - (@code.length + 1))
  end

  # Function to display current guess with informational text
  def display_current_guess_info_text
    puts current_guess_info_text(@last_code_guess)
  end

  # Function to display current code with informational text
  def display_current_code_info_text
    puts current_code_info_text(@code)
  end

  # Function to display remaining colors that may be included in the code
  def display_remaining_colors(colors)
    puts current_remaining_guess_colors(colors)
  end

  # Function to display current guess feedback
  def display_current_guess_feedback_text
    puts current_guess_feedback_text(@guess_feedback)
  end
end
