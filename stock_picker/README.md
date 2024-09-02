# Stock Picker
https://github.com/bjake5/ruby-projects/tree/master/stock_picker
## Feature Description
* This is a Ruby function to determine the best buy/sell day pairing for a stock within a time series to maximize profit.
## Interface
* IRB / REPLs
## Inputs
* [Array] – A set of daily stock prices within a continuous time series (array index is the implied day)
## Outputs
* [Array] – The indexes of the best day to buy and sell the stock.
## Example
`stock_picker([17,3,6,9,15,8,6,1,10])`
`=> [1,4]  # for a profit of $15 - $3 == $12`
