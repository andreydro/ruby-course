class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_type
  	@trains.each { |train| puts "#{train.type} - #{train.number}"}
  end

  def get_train(train)
  	@trains.push(train)
  end

  def send_train(train)
  	@trains[train.type.to_sym].delete(train)
  end
end