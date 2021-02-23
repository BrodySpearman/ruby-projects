require 'pry'

price_chart = Array.new(10) { rand(1.00..100.00).round(2) }

days = {
  "Day 1" => price_chart[0],
  "Day 2" => price_chart[1],
  "Day 3" => price_chart[2],
  "Day 4" => price_chart[3],
  "Day 5" => price_chart[4],
  "Day 6" => price_chart[5],
  "Day 7" => price_chart[6],
  "Day 8" => price_chart[7],
  "Day 9" => price_chart[8],
  "Day 10" => price_chart[9]
}

# places days in a column format with a ": " separator.
puts days.map { |v| v * ': $' } * "\n"

def stock_picker(price_chart)
  profits = {}
  # places potential profits into profits object.
  price_chart.each_with_index do |price1, index1|
    price_chart.each_with_index do |price2, index2|
        if index2 > index1
            profits[[index1, index2]] = price2 - price1
        end
    end
  end
  profits = profits.sort_by { |k, v| v }

  # after sorting profits, takes last one to find out max profit.
  max_profit = profits[-1]
  puts "Buy on day #{max_profit[0][0] + 1} and sell on day #{max_profit[0][1] + 1} for a maximum profit of $#{max_profit[1].round(2)}"
end

stock_picker(price_chart)