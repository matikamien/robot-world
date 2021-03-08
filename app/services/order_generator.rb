class OrderGenerator

  def initialize warehouse
    @warehouse = warehouse
  end

  def generate_order model
    if (@warehouse.store_stock_by_model model) > 0
      car = @warehouse.get_car_from_store model
      order = Order.create! car_id:car.id
      @warehouse.decrement_store car
      return order
    end
    NoOrder.new model
  end

end
