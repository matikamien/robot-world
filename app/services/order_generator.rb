class OrderGenerator

  def initialize warehouse
    @warehouse = warehouse
  end

  def generate_order model
    order = check_store_stock_and_generate_order_if_applies model
    order.nil? ? check_factory_stock_and_generate_order_if_applies(model) : order
  end

  def check_store_stock_and_generate_order_if_applies model
    store_stock = @warehouse.store_stock_by_model(model)
    store_stock > 0 ? create_order_and_delete_car(@warehouse.get_car_from_store(model), @warehouse.store_stock) : nil
  end

  def check_factory_stock_and_generate_order_if_applies model
    factory_stock = @warehouse.factory_stock_by_model(model)
    factory_stock > 0 ? check_cars_without_defect(model) : create_no_order(model)
  end

  def check_cars_without_defect model
    cars = @warehouse.get_cars_from_factory model
    car_without_defect = cars.find { |car| !car.has_defect }
    car_without_defect.nil? ? create_no_order(model) : create_order_and_delete_car(car_without_defect, @warehouse.factory_stock)
  end

  def create_order_and_delete_car car,stock_to_decrement
    order = Order.create! car_id: car.id
    stock_to_decrement.delete car
    order
  end

  def create_no_order model
    NoOrder.new(model)
  end

end
