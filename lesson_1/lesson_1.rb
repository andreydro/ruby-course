puts 'What is your name?'
name = gets.chomp

puts 'What year have you been bord?'
year = gets.chomp
puts "Hello, #{name}! Your are about #{2018 - year.to_i} years old"
