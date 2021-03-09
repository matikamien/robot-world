##
# This class knows how to check if there is stock for some car model and is also responsible for retrieving the car from warehouse.

class StockService

  def initialize
    @defect_service = DefectService.new
    @warehouse = Warehouse.new
  end

  ##
  # Check if there is stock in the warehouse for the received car model.
  #
  # First, it goes to check stock to the store stock. If there is no stock there,
  # it goes to the factory stock checking that the car has no defects.

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

  # Return the requested car from the warehouse and also decrement the stock (mark the car as sold).
  #
  # First, it goes to get the car from the store. If the car is not there,
  # it goes to the factory checking that the car has no defects.
  #
  # This method should be called after confirming there is stock available.

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