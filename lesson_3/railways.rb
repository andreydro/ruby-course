class RailwayStation
  attr_reader :name, :trains

  def initialize(station)
    @name = name
    @trains = []
  end

  def arrive(train)
    @trains.push(train)
  end

  def departure(train)
  	@trains.delete(train)
  end

  def show_parked_trains
    @trains	
  end

  def show_type_of_train(type)
  	trains.count { |train| train.type == type }
  end
end

class Route
  attr_reader :stations

  def initialize(first, last)
  	@stations = [first, last]
  end

  def add(station)
  	stations.insert(-2, station) 
  end

  def delete(station)
  	stations.delete(station)
  end

  def show
  	@stations
  end

  def first_station
    stations.first
  end

  def last_station
  	stations.last
  end
end

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

  def show_cars
  	@number_of_cars
  end

  def add_car
  	@number_of_cars += 1 if @speed == 0
  end

  def delete_car
  	@number_of_cars -= 1 if @speed == 0 && @number_of_cars > 0
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