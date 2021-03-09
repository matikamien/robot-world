##
# This class knows how to instantiate a Robot Buyer.

class RobotBuyerService

  def self.buy_cars
    stock_service = StockService.new
    order_generator = OrderGeneratorService.new stock_service
    logger = ConsoleLoggerService.new
    RobotBuyer.new(order_generator, logger).buy_cars
  end

end