class Train
  attr_reader :type, :number_of_cars, :route

	def initialize(number, type, number_of_cars)
		@number = number
		@type = type
		@number_of_cars = number_of_cars
		@speed = 0
	end

  def current_speed
    @speed
  end

  def show_cars
  	@number_of_cars
  end

  def take_route=(name_of_route)
  	@route = name_of_route
  	@current_station_index = 0
  	@current_station.arrive(self)
  end

  def current_station
    route.stations[@current_station_index]
  end

  def previous_station
    if @current_station_index > 0
      route.stations[@current_station_index - 1]
    end
  end

  def next_station
  	route.stations[@current_station_index + 1] 
  end

  def add_car
    @number_of_cars += 1 if @speed == 0
  end

  def delete_car
    @number_of_cars -= 1 if @speed == 0 && @number_of_cars > 0
  end
   
  protected

  def speed_up(value)
    @speed += value
  end

  def speed_down(value)
    if @speed - value < 0
      @speed = 0
    else
      @speed -= value
    end
  end

  def go_forward
    if current_station && next_station
      current_station.departure(self)
      @current_station_index +=1
      current_station.arrive(self)
      current_station
    end
  end
  
  def go_back
    if current_station && next_station
      current_station.departure(self)
      @current_station_index +=1
      current_station.arrive(self)
      current_station
    end
  end
end