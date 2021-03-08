class OrderChangeService

  def initialize(order_id, car_model, order_generator)
    @order_id = order_id
    @car_model = car_model
    @order_generator = order_generator
  end

  def create_order_change
    order = order_generator.generate_order @car_model
    OrderChange.create!(order_id:@order_id, car_model:@car_model)
  end

end
