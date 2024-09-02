# frozen_string_literal: true

module ActionText
  def player_name_prompt
    "What is the player's name?"
  end

  def player_role_prompt(name)
    "What is the #{name}'s role for this game? The available roles are:"
  end
end
