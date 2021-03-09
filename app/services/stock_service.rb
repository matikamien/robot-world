##
# This class knows how to check if there is stock for some car model and is also responsible for retrieving the car from warehouse.

class StockService

  def initialize
    @defect_service = DefectService.new
    @warehouse = Warehouse.new
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
    car_without_defect = cars.find { |car| !@defect_service.car_has_defect(car) }
    car_without_defect.nil? ? false : true
  end

  # Return the requested car and decrement the stock.
  def get_car_from_warehouse model
    car = @warehouse.get_car_from_store(model)
    !car.nil? ? sell_car(car) : get_car_from_factory(model)
  end

  def get_car_from_factory model
    cars = @warehouse.get_cars_from_factory model
    car_without_defect = cars.find { |car| !@defect_service.car_has_defect(car) }
    sell_car(car_without_defect)
  end

  def sell_car car
    car.location_sold!
    car
  end
end