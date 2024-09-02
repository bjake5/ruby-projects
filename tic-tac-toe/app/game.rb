# This is the class that organizes the basic gameplay, board setup, and tracking actions from the players
class Game
  attr_accessor :players, :current_player, :turns

  # Initiative the game, including the various board positions
  def initialize(players)
    @players = players # Add the players to the game
    @cat_game = false # Indicates if this is a cat game
    @current_player = nil # Current player making a selection
    @last_selection = nil # Last valid user input selection
    @turns = 0 # Total turns take in the game
    @valid_board_positions = {
      TOP_LEFT: { label: "Top Left", row: 0, column: 0, value: "_" },
      TOP_MIDDLE: { label: "Top Middle", row: 0, column: 1, value: "_" },
      TOP_RIGHT: { label: "Top Right", row: 0, column: 2, value: "_" },
      MIDDLE_LEFT: { label: "Middle Left", row: 1, column: 0, value: "_" },
      CENTER: { label: "Center", row: 1, column: 1, value: "_"  },
      MIDDLE_RIGHT: { label: "Middle Right", row: 1, column: 2, value: "_" },
      BOTTOM_LEFT: { label: "Bottom Left", row: 2, column: 0, value: "_" },
      BOTTOM_MIDDLE: { label: "Bottom Middle", row: 2, column: 1, value: "_" },
      BOTTOM_RIGHT: { label: "Bottom Right", row: 2, column: 2, value: "_" }
    }
  end

  # Basic gameplay function which will render the game board, select the next player, and execute the selections until game_over? logic is met
  def play_game
    until game_over?
      render_game_board
      determine_current_player
      make_selection
    end
    finish_game
  end

  private

  # Render the game board using the instance variable board positions hash
  def render_game_board
    puts "\n"
    i = 0
    while i <= 3
      puts @valid_board_positions.filter_map { |_position, data| data[:value] if data[:row] == i }.join(" | ")
      i += 1
    end
  end

  # Randomly select the first player
  # Pick the prior player that didn't have the last turn moving forward
  def determine_current_player
    if @turns.zero?
      puts "\nRandomly selecting the first player..."
      select_first_player
    else
      @current_player = players.select { |player| player.last_turn_number < @turns }.pop
    end
  end

  # Randomly select the first player to go first each game
  def select_first_player
    @current_player = players[Random.rand(0...players.length)]
  end

  # Take user input, validate input against valid positions hash, and store the selection in the hash
  def make_selection
    puts "\nThe current player is #{@current_player.name}. Please make a selection from the following options:"
    print_valid_moves
    @last_selection = gets.chomp
    until valid_move?
      puts "\nInvalid selection, please try again!"
      print_valid_moves
      @last_selection = gets.chomp
    end
    puts "\n#{@current_player.name} chooses the #{@last_selection} position!"
    @turns += 1
    player_symbol = @current_player.symbol
    @valid_board_positions[@last_selection.to_sym][:value] = player_symbol
    @current_player.last_turn_number = @turns
  end

  # Determine if the player input for the selection matches the hash keys
  def valid_move?
    @valid_board_positions.include?(@last_selection.to_sym)
  end

  # Print the valid moves for the player
  def print_valid_moves
    puts @valid_board_positions.select { |_position, data| data[:value] == "_" }.keys
    puts "–––––––––––––"
  end

  # Check the three horizontal rows of the tic-tac-toe grid after each selection to determine if the last player won
  def check_rows_for_game_over
    i = 0
    while i < 3
      row = @valid_board_positions.filter_map { |_position, data| data[:value] if data[:row] == i }
      return true if row.uniq.size == 1 && row.count { |position| position != "_" } > 1

      i += 1
    end
  end

  # Check the three vertical columns of the tic-tac-toe grid after each selection to determine if the last player won
  def check_columns_for_game_over
    i = 0
    while i < 3
      column = @valid_board_positions.filter_map { |_position, data| data[:value] if data[:column] == i }
      return true if column.uniq.size == 1 && column.count { |position| position != "_" } > 1

      i += 1
    end
  end

  # Check the two diagonals of the tic-tac-toe grid after each selection to determine if the last player won
  def check_diagonals_for_game_over
    top_left_bottom_right = []
    top_left_bottom_right[0] = @valid_board_positions[:TOP_LEFT][:value]
    top_left_bottom_right[1] = @valid_board_positions[:CENTER][:value]
    top_left_bottom_right[2] = @valid_board_positions[:BOTTOM_RIGHT][:value]
    if top_left_bottom_right.uniq.size == 1 && top_left_bottom_right.count { |position| position != "_" } > 1
      return true
    end

    top_right_bottom_left = []
    top_right_bottom_left[0] = @valid_board_positions[:TOP_RIGHT][:value]
    top_right_bottom_left[1] = @valid_board_positions[:CENTER][:value]
    top_right_bottom_left[2] = @valid_board_positions[:BOTTOM_LEFT][:value]
    true if top_right_bottom_left.uniq.size == 1 && top_right_bottom_left.count { |position| position != "_" } > 1
  end

  # Check if there are any valid selections left (cat game?)
  def game_over?
    if @valid_board_positions.none? { |_position, data| data[:value] == "_" }
      @cat_game = true
      return true
    elsif check_rows_for_game_over == true ||
          check_columns_for_game_over == true ||
          check_diagonals_for_game_over == true
      return true
    end
    false
  end

  # Finish the game
  def finish_game
    if @cat_game == true
      puts "\nCat game, nobody wins!\n"
    else
      puts "\n#{@current_player.name} wins the game!"
    end
  end
end
