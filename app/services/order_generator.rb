class OrderGenerator

  def initialize stock_service
    @stock_service = stock_service
  end

  def generate_order model
    if @stock_service.has_stock model
      car = @stock_service.get_car_from_warehouse model
      return Order.create! car_id: car.id
    end
    NoOrder.new(model)
  end

end
