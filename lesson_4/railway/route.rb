class Route
  attr_reader :stations

  def initialize(first, last)
  	@stations = [first, last]
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

  private

  def add(station)
    stations.insert(-2, station) 
  end

  def delete(station)
    stations.delete(station)
  end

end