require_relative "modules/instance_counter"
require_relative "modules/company"
require_relative "modules/valid"

class Train
  include InstanceCounter
  include Company
  include Valid

  attr_reader :type, :number_of_cars, :route

  TRAIN_NUMBER = /^[a-zA-Z0-9]{3}.*\w{2}\z/i

  @@trains_list = {}

	def initialize(number, type, number_of_cars)
		@number = number
		@type = type
		@number_of_cars = number_of_cars
		@speed = 0
    validate!
    add_trains_to_train_list
    register_instance
	end


  def self.find(number)
    puts "Train is found: "
    @@trains_list[number]
  end

  def add_trains_to_train_list
    if @@trains_list.key?(@number)
      puts "Train with this number already exists."
    else
      @@trains_list[@number] = self
    end
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

  def validate!
    raise "Train number should be of the form (XXX-XX)" if number !~ TRAIN_NUMBER
  end
end