class Station
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