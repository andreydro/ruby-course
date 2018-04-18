require_relative "modules/instance_counter"

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@station_list = []

  def self.all
    puts "There are following station added: "
    @@station_list
  end

  def initialize(name)
    @name = name
    @trains = []
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
end