require_relative "train"
require_relative "route"
require_relative "station"
require_relative "passanger_train"
require_relative "cargo_train"

station = Station.new("London")

train = PassangerTrain.new(626, "passanger", 10)
train_2 = CargoTrain.new(454, "cargo", 10)
train_3 = PassangerTrain.new(461, "passanger", 15)
train.add_car
train.add_car
train.delete_car
station.arrive(train)
station.arrive(train_2)
station.arrive(train_3)
puts station.show_parked_trains