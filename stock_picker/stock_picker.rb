# A function to identify the best days to buy and sell a stock based on gross profit margin using stock price by day data
# Returns buy and sell day indexes

def stock_picker (stock_prices)

  stock_prices_with_index = Array.new
  valid_buy_sell_days = Array.new
  
  # Iterate through the stock prices to pull out their index
  stock_prices.each_with_index { |price, index| stock_prices_with_index << [price, index] }
  
  # Create permutations of all possible buy and sell days
  stock_prices_with_index = stock_prices_with_index.permutation(2).to_a
  
  # Filter the invalid permutations where a sell would happen before a buy 
  # Use filter results to create a new array with valid days
  stock_prices_with_index.each do |stock_price_permutation|
    if stock_price_permutation[0][1] < stock_price_permutation[1][1]
      stock_price_permutation << (stock_price_permutation[1][0] - stock_price_permutation[0][0])
      valid_buy_sell_days << stock_price_permutation
    end
  end  

  # Identify the best price from the valid days using gross profit margin
  best_buy_sell_days_by_price = valid_buy_sell_days.max_by { |a, b, c| c }.flatten

  # Extract the buy and sell days from the pricing data 
  return best_buy_sell_days = [best_buy_sell_days_by_price[1],best_buy_sell_days_by_price[3]]
end  