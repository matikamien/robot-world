class RobotBuyer

  CAR_MODELS = %w[Megane Tida Corsa March Up Gol Polo Fun Golf Vento]

  def initialize order_generator,logger
    @order_generator = order_generator
    @logger = logger
  end

  def buy_cars
    orders = []

    get_amount_of_cars_to_buy.times do
      order = @order_generator.generate_order get_model
      log_order_if_was_unsuccessful(orders, order)
    end

    orders
  end

  # Returns a number between 1 and 9 (inclusive).
  def get_amount_of_cars_to_buy
    rand(9) + 1
  end

  def get_model
    CAR_MODELS[rand(10)]
  end

  def log_order_if_was_unsuccessful (orders,order)
    if order.was_successful
      orders << order
    else
      @logger.log order
    end
  end

end
