# Purpose
This repository is used to organize the basic projects to practice the fundamental Ruby skils.

<hr>

# Bubble Sort
https://github.com/bjake5/ruby-projects/tree/master/bubble_sort
## Feature Description
* This is a Ruby function to sort a set of unordered numbers using the "Bubble Sort" algorithm.
## Interface
* IRB / REPLs
## Inputs
* [Array] – A set of unordered numbers.
## Outputs
* [Array] – A set of ordered numbers.
## Example
`bubble_sort([4,3,78,2,0,2])`
`=> [0,2,2,3,4,78]`
<hr>

# Casesar Cipher
https://github.com/bjake5/ruby-projects/tree/master/caesar_cipher
## Feature Description
* This is a Ruby function to shift the alphabet characters within an input string by a specific shift factor.
## Interface
* IRB / REPLs
## Inputs
* String – An input string to apply the shift algorithm against.
* Integer – The number of spaces to shift the alphabet characters.
## Outputs
* String – The modified output string.
## Example
`caesar_cipher("What a string!", 5)`
`=> "Bmfy f xywnsl!"`
<hr>

# Mastermind
https://github.com/bjake5/ruby-projects/tree/master/mastermind
## Feature Description
* This is a packaged OOP command line game to play the game Mastermind against a computer.
* The object of the game is for one entity to select a 4 color "code" and see if the other entity can guess it within 12 tries.
* Each guess will provide feedback with how many colors are correctly ordered or in the code, but incorrectly ordered.
* The player can choose to either provide a 4 color code and have the computer guess or guess a computer-generated 4 color code.
## Interface
* Command Line (prompted)
## Inputs
* [Array] – code built from String-level individual color input.
* [Array] – guesses built from String-level individual color input.
## Outputs
* [Array] – feedback on each guess ("red" if correct color & position, "white" if correct color, incorrect position).
* [Array] – guess history.
## Getting Started
run `app/play.rb`

![Screen Shot 2024-09-04 at 12 21 07 PM](https://github.com/user-attachments/assets/f9b23b32-3d05-4a82-b6ce-af058f2f0625)

<hr>

# Stock Picker
https://github.com/bjake5/ruby-projects/tree/master/stock_picker
## Feature Description
* This is a Ruby function to determine the best buy/sell day pairing for a stock within a time series to maximize gross profit.
## Interface
* IRB / REPLs
## Inputs
* [Array] – A set of daily stock prices within a continuous time series (array index is the implied day)
## Outputs
* [Array] – The indexes of the best day to buy and sell the stock.
## Example
`stock_picker([17,3,6,9,15,8,6,1,10])`
`=> [1,4]  # for a profit of $15 - $3 == $12`
<hr>

# Substrings
https://github.com/bjake5/ruby-projects/tree/master/substrings
## Feature Description
* This is a Ruby function to count the number of substrings in an input string that match a defined word dictionary.
## Interface
* IRB / REPLs
## Inputs
* [Array] – A dictionary with words to search for within the input string.
* String – An input string.
## Outputs
* {Hash} – Key: Dictionary word found in the input string | Value: Count within the input string
## Example
`dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]`

`substrings("Howdy partner, sit down! How's it going?", dictionary)`
`=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }`
<hr>

# Tic-Tac-Toe
https://github.com/bjake5/ruby-projects/tree/master/tic-tac-toe
## Feature Description
* This is a packaged OOP command line game to play tic-tac-toe with two people.
* Each player may select their display name and symbol/string to be used within the tic-tac-toe board.
* The first player will be randomly selected each game.
## Interface
* Command Line (prompted)
## Inputs
* String – Player name and player symbol
* String – Player board position selection (validated against a dictionary)
## Outputs
* Strings – to render the tic-tac-toe board, solicit user input, and enable gameplay.
## Getting Started
Run `ruby main.rb`

![Screen Shot 2024-09-02 at 11 59 42 AM](https://github.com/user-attachments/assets/132c3124-2429-4e04-bab7-c42c1a7ff74b)

