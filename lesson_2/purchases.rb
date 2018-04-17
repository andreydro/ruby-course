good = 0
basket = {}
good_basket = {}
sum_of_good = {}
total_sum = 0
while good do
  puts "Please, insert name of the good"
  good = gets.chomp
  if good == "stop" then
  	break
  end
  puts "Please, insert price of the good"
  price = gets.chomp.to_i
  puts "Please, insert quantity of the good"
  quantity = gets.chomp.to_i
  sum = price * quantity
  good_basket.store("price", price)
  good_basket.store("quantity", quantity)
  sum_of_good.store(good, sum)
  basket.store(good, good_basket)
  total_sum += sum
end

puts basket

sum_of_good.each do |key, value|
  puts "You should pay " + value.to_s + " for the " + key.to_s
end

puts "And the total price for all goods in your basket is " + total_sum.to_s