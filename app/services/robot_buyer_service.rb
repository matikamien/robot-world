class RobotBuyerService

  def self.buy_cars
    stock_service = StockService.new
    order_generator = OrderGenerator.new stock_service
    logger = ConsoleLogger.new
    RobotBuyer.new(order_generator, logger).buy_cars
  end

end