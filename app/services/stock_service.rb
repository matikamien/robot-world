class StockService

  def initialize warehouse
    @warehouse = warehouse
  end

  def has_stock model
    store_stock = @warehouse.store_stock_by_model(model)
    store_stock > 0 ? true : check_stock_in_factory(model)
  end

  def check_stock_in_factory model
    factory_stock = @warehouse.factory_stock_by_model(model)
    factory_stock > 0 ? check_cars_without_defect(model) : false
  end

  def check_cars_without_defect model
    cars = @warehouse.get_cars_from_factory model
    car_without_defect = cars.find { |car| !car.has_defect }
    car_without_defect.nil? ? false : true
  end

  # Return the requested car and decrement the stock.
  def get_car_from_warehouse model
    car = @warehouse.get_car_from_store(model)
    !car.nil? ? delete_car_and_return_it(car, @warehouse.store_stock) : get_car_from_factory(model)
  end

  def get_car_from_factory model
    cars = @warehouse.get_cars_from_factory model
    car_without_defect = cars.find { |car| !car.has_defect }
    delete_car_and_return_it(car_without_defect, @warehouse.factory_stock)
  end

  def delete_car_and_return_it car,stock_to_delete
    stock_to_delete.delete car
    car
  end
end