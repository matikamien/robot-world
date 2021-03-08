class RobotBuyerService

  @@count = 0
  @@warehouse = Warehouse.new
  @@stock_service = StockService.new @@warehouse
  @@order_generator = OrderGenerator.new @@stock_service

  def self.buy_cars
    set_attributes_if_needed
    RobotBuyer.instance.buy_cars
  end

  def self.get_stock_service
    @@stock_service
  end

  def set_warehouse warehouse
    @@warehouse = warehouse
  end

  def self.set_attributes_if_needed
    if @@count == 0
      RobotBuyer.instance.order_generator = @@order_generator
      RobotBuyer.instance.logger = ConsoleLogger.new
      @@count += 1
    end
  end

end