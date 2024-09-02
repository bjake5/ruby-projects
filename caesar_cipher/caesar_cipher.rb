# frozen_string_literal: true

def caesar_cipher(raw_string, shift_factor)
  # Convert string into integer codepoints
  raw_string_chars = raw_string.codepoints
  # If statement: Shift letters before end of the alphabet & maintain capitalization
  # Elsif statement: Wrap letters at the end of the alphabet & maintain capitalization
  # Pass through all other chars as-is
  new_string_chars = raw_string_chars.map do |char|
    if (char >= 65 && char <= (90 - shift_factor)) || (char >= 97 && char <= (122 - shift_factor))
      char + shift_factor
    elsif (char > (90 - shift_factor) && char <= 90) || (char > (122 - shift_factor) && char <= 122)
      char + shift_factor - 26
    else
      char
    end
  end
  # Pack chars into a new string with shift factor applied
  new_string_chars.pack('U*')
end
