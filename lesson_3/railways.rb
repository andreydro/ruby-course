class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_type
  	cargo_train = @trains[:cargo].count
  	passenger_train = @trains[:passenger].count

  	puts "Station #{@name} has #{cargo_train} cargo trains and #{passenger_train} passenger trains"
  end

  def get_train(train)
  	@trains[train.type.to_sym].push(train)
  end

  def send_train(train)
  	@trains[train.type.to_sym].delete(train)
  end
end

class Route
  attr_accessor :route, :first_station, :last_station

  def initialize(first_station,last_station)
    @route = [first_station,last_station]
  end

  def add_station(station)
  	@route.insert(-2, station)
  end

  def delete_station(station)
  	@route.delete(station)
  end

  def list_stations
  	@route
  end

  def route_station(station_index)
  	@route[station_index]
  end

  def last_station
  	@route.last
  end

  def station_index(station)
  	@route.index(station.name)
  end
end

class Train
  attr_accessor :number, :type, :wagons, :speed, :set_route, :go_forward, :route

  def initialize(number, type, wagons = 1, speed = 0)
  	@number = number
  	@type = type
  	@wagons = wagons
  	@speed = speed
  end

  def go_forward(station_from, station_to)
  	self.speed_up(80) if @speed.zero?
  	puts "Speed: #{self.speed}"

  	@station_index = @route.station_index(station_to)

  	puts "The train arrived at the station: #{self.current_station}"

  	if @current_station != @route.last_station
  		station_to.get_train(self)
  	else
  		puts "The train at the last station"
  	end

  	if @current_station != @route.route.first
  		station_from.send_train(self)
  	else
  		puts "The train to the first station"
  	end
  end

  def current_station
  	@route.route_station(@station_index)
  end

  def previous_station
    @route.route_station(@station_index - 1)
  end

  def next_station
  	@route.route_station(@station_index + 1)
  end

  def set_route(route)
  	@route = route
  end

  def speed_up(speed)
  	if speed < 0
  		puts "Error. The speed is a negative value"
  	elsif speed < 100
  		@speed = speed
  		puts " Speed: #{@speed}"
  	else
  		puts "The train can not go so fast!"
  	end
  end

  def stop
  	@speed = 0
  	puts "The train stopped."
  end

  def add_wagon
  	if @speed.zero?
  		@wagons += 1
  	else
  		puts "It's inpossible. The train moves"
  	end
  end

  def delete_wagon
  	if @speed.zero? && @wagons > 0
  		@wagons -= 1
  	else
  		puts "It's inspossible. The train is moving or"
  end
end