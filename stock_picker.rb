def stock_picker(stock_prices)
  puts "Too few days!" if stock_prices.length < 2
  buy_day = 0
  sell_day = 0
  profit = 0

  stock_prices.each_with_index do |buy_price, buy_index|
  	stock_prices.each_with_index do |sell_price, sell_index|
      if (buy_index < sell_index) && (sell_price - buy_price > profit)
        profit = sell_price - buy_price
        buy_day = buy_index
        sell_day = sell_index
      end
    end
  end
  return a = [buy_day, sell_day] unless buy_day == sell_day
end

puts stock_picker([17, 2, 3, 4, 5, 18, 12, 27, 2, 3, 4])
