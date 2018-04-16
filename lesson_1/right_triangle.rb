puts "Insert first side of the triangle"
first = gets.chomp.to_i
puts "Insert second side of the triangle"
second = gets.chomp.to_i
puts "Insert third side of the triangle"
third = gets.chomp.to_i

if (first**2 == second**2 + third**2)
  puts "It's right_triangle"
  if (first == second || second == third || first == third)
    puts "It's also isosceles triangle"
  end
elsif (second**2 == first**2 + third**2)
  puts "It's right_triangle"
  if (first == second || second == third || first == third)
    puts "It's also isosceles triangle"
  end  
elsif (third**2 == first**2 + second**2)
  puts "It's right_triangle"
  if (first == second || second == third || first == third)
    puts "It's also isosceles triangle"
  end
elsif (first == second && second == third)
  puts "It's equilateral and isosceles triangle"
else
  puts "This ordinary triangle"
end