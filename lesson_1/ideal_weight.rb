puts "What is your name?"
name = gets.chomp

puts "What is your height?"
height = gets.chomp
weight = height.to_i - 110
if (weight < 0)
  puts "Your weight is optiomal"
else
  puts "Hello, #{name}! Your ideal weigth is #{weight}"
end