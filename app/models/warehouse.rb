class Warehouse

  def park_car(car)
    car.location_factory_stock!
  end

  def factory_stock
    Car.all.select{ |car| car.location_factory_stock? }
  end

  def store_stock
    Car.all.select{ |car| car.location_store_stock? }
  end

  def park_cars(cars)
    cars.each do |car|
      car.location_factory_stock!
    end
  end

  def factory_stock_by_model(model)
    factory_stock.select{ |car| car.model == model }.size
  end

  def total_factory_stock
    factory_stock.size
  end

  def add_cars_to_store cars
    cars.each do |car|
      car.location_store_stock!
    end
  end

  def store_stock_by_model(model)
    store_stock.select{ |car| car.model == model }.size
  end

  def total_store_stock
    store_stock.size
  end

  def get_car_from_store model
    store_stock.find{ |car| car.model == model }
  end

  def get_cars_from_factory model
    factory_stock.find_all{ |car| car.model == model }
  end

end