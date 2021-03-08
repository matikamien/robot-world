class Warehouse

  attr_reader :factory_stock
  attr_reader :store_stock

  def initialize
    super
    @factory_stock = []
    @store_stock = []
  end

  def park_car(car)
    @factory_stock << car
  end

  def park_cars(cars)
    @factory_stock += cars
  end

  def factory_stock_by_model(model)
    @factory_stock.select{ |car| car.model == model }.size
  end

  def total_factory_stock
    @factory_stock.size
  end

  def add_cars_to_store cars
    @store_stock += cars
  end

  def store_stock_by_model(model)
    @store_stock.select{ |car| car.model == model }.size
  end

  def total_store_stock
    @store_stock.size
  end

  def get_car_from_store model
    @store_stock.find{ |car| car.model == model }
  end

  def get_cars_from_factory model
    @factory_stock.find_all{ |car| car.model == model }
  end

  def decrement_store_stock car
    @store_stock.delete car
  end

  def decrement_factory_stock car
    @factory_stock.delete car
  end

end