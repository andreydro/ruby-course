class PassangerTrain < Train
  def add_car
  	if @type == "passanger"
      @number_of_cars += 1 if @speed == 0
    end
  end
end