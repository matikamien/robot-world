class Warehouse

  attr_reader :cars

  def initialize
    super
    @cars = []
  end

  def park_cars(cars)
    @cars += cars
  end

  def factory_stock_by_model(model)
    cars.select{ |car| car.model == model }.size
  end

end