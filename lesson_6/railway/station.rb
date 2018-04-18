require_relative "modules/instance_counter"
require_relative "modules/valid"


class Station
  include InstanceCounter
  include Valid

  attr_reader :name, :trains

  NAME_FORMAT = /^[a-zA-Zа-яА-Я0-9]$/

  @@station_list = []

  def self.all
    puts "There are following station added: "
    @@station_list
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@station_list << self
    register_instance
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

  protected

  def validate!
    raise "Station Name should be longer than two characters." if name.length < 2
    raise "Station name must consist of letters." if name !~ NAME_FORMAT
  end
  
end