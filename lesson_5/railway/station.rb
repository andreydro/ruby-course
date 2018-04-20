require_relative 'modules/instance_counter'

class Station
  include InstanceCounter

  attr_accessor :name, :trains

  @@station_list = []

  def initialize(name)
    @name = name
    @trains = []
    @@station_list << self
    register_instance
  end

  class << self
    def all
      @@station_list
    end
  end

  def trains_type
    @trains.each { |train| puts "#{train.type} - #{train.number}" }
  end

  def get_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains[train.type.to_sym].delete(train)
  end
end
