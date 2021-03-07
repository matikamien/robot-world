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

  def total_store_stock
    @store_stock.size
  end

end