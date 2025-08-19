# @param {Integer[]} prices
# @return {Integer}

# def max_profit(prices)
#   puts "prices: #{prices}"
#   gains = 0
#   buy_price = 0
#   sell_price = 0

#   0.upto(prices.length - 1) do |i|
#     # puts "i: #{i}"

#     yesterday = if i == 0
#       nil # don't wrap
#     else
#       prices[i - 1]
#     end
#     today = prices[i]
#     tomorrow = prices[i + 1]
#     puts "yesterday: #{yesterday}; today: #{today}; tomorrow: #{tomorrow}"

#     spread = today - yesterday if yesterday
#     lookahead_spread = if tomorrow.nil?
#       # final day.
#       1 # must sell?
#     else
#       today - tomorrow
#     end

#     puts "spread: #{spread}"
#     puts "lookahead_spread: #{lookahead_spread}"

#     if spread.nil? || spread <= 0
#       # buy low
#       buy_price = today
#       puts "new low; buy_price: #{buy_price}"
#     else
#       # rising
#       sell_price = today
#       puts "rising: #{sell_price}"

#       if lookahead_spread >= 0
#         # sell high
#         sale = sell_price - buy_price
#         gains += sale

#         # reset
#         sell_price = buy_price = 0

#         puts "sell high; sale: #{sale}; gains: #{gains}"
#       end
#     end
#     puts "-----"
#   end

#   gains
# end

def max_profit(prices)
  profit = 0
  1.upto(prices.length - 1) do |i|
    left = prices[i - 1]
    current = prices[i]
    if current > left
      profit += current - left
    end
  end
  profit
end

prices1 = [7,1,5,3,6,4]
r = max_profit(prices1)
puts r
puts r == 7

# Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
# Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
# Total profit is 4 + 3 = 7.

prices2 = [1,2,3,4,5]
r = max_profit(prices2)
puts r
puts r == 4

# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
# Total profit is 4.

prices3 = [7,6,4,3,1]
r = max_profit(prices3)
puts r
puts r == 0

# Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.

prices4 = []
r = max_profit(prices4)
puts r
puts r == 0

prices5 = [1]
r = max_profit(prices5)
puts r
puts r == 0


prices6 = [5,2,3,2,6,6,2,9,1,0,7,4,5,0]
#              1     4   7     7   1

r = max_profit(prices6)
puts r
puts r == 20