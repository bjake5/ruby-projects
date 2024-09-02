# Class to organize player object data
class Player
  attr_accessor :name, :symbol, :last_turn_number

  def initialize(name, symbol)
    @name = name # Player name
    @last_turn_number = 0 # Int of the last turn taken in the game
    @symbol = symbol # Symbol to be shown in the tic-tac-toe grid
    welcome
  end

  # Basic player welcome message to display when starting the game
  def welcome
    puts "\nHi, #{name}! Welcome to Bjake's Command Line Tic-Tac-Toe Game!"
  end
end
