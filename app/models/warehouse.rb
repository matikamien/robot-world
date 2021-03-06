class Warehouse

  attr_reader :cars

  def initialize
    super
    @cars = []
  end

  def park_car(car)
    @cars << car
  end

  def park_cars(cars)
    @cars += cars
  end

  def factory_stock_by_model(model)
    @cars.select{ |car| car.model == model }.size
  end

  def total_factory_stock
    @cars.size
  end

end