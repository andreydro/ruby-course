puts "Insert coefficient 1"
a = gets.chomp.to_i
puts "Insert coefficient 2"
b = gets.chomp.to_i
puts "Insert coefficient 3"
c = gets.chomp.to_i

d = (b**2 - 4*a*c)

if (d > 0)
  puts "Discriminant: " + d.to_s
  puts "Root 1: " + ((-b + Math.sqrt(d))/(2*a)).to_s
  puts "Root 2: " + ((-b - Math.sqrt(d))/(2*a)).to_s
elsif (d == 0)
  puts "Discriminant: " + d.to_s
  puts "Root: " + (-b/(2*a)).to_s
else
  puts "There are no roots"
end