
hash = { 'january' => 31, 'february' => 28, 'march' => 31, 'april' => 30,
         'may' => 31, 'june' => 30, 'july' => 31, 'august' => 30,
         'september' => 30, 'october' => 31, 'november' => 30, 'december' => 31 }

array = []
index = 10
while index <= 100
  array.push(index)
  index += 5
end

vowels = { a: 1, e: 5, i: 9, o: 15, u: 21, y: 25 }

puts 'Insert year'
year = gets.chomp.to_i
puts 'Insert month'
month = gets.chomp.to_i
puts 'Insert day'
day = gets.chomp.to_i
inserted_date = Time.new(year, month, day)
days = (((inserted_date - Time.new(year, 1, 1)) / 60) / 60) / 24
puts "It's #{days} days from the beginning of the #{year} to #{inserted_date}"
