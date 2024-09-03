# frozen_string_literal: true

module ActionText
  def horizontal_line
    "\n––––––––––––––––––––––––––––––––––––-–"
  end

  def player_name_prompt
    "What is the player's name?"
  end

  def player_role_prompt(name)
    "What is the #{name}'s role for this game? The available roles are:"
  end

  def guess_info_text(guess_number, guesses_remaining)
    "\nThis is guess #{guess_number}. You have #{guesses_remaining} guesses remaining."
  end

  def guess_player_prompt(color_number, colors_remaining)
    "\nPlease select color ##{color_number} for your guess. You will have #{colors_remaining} colors remaining to select after this guess."
  end

  def current_guess_info_text(code)
    "\nYou current code guess is #{code}."
  end

  def current_remaining_guess_colors(colors)
    "\nThe current remaining colors are: #{colors}."
  end

  def current_guess_feedback_text(feedback)
    "\nThis is the feedback on your last code guess: #{feedback}."
  end
end
