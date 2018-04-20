class SportCar < Car
  def start_engine
    puts 'Click!'
    super
    puts 'Wroomm!'
  end

  private

  def initial_rpm
    1000
  end
end
