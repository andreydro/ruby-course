def fibonacci(f)
  if f < 3
  	1
  else
  	fibonacci(f - 1) + fibonacci(f - 2)
  end
end
fibonacci_numers = []
(1..11).each {|f| fibonacci_numers.push(fibonacci(f))}
print fibonacci_numers