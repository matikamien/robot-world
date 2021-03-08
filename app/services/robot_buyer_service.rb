class RobotBuyerService

  @@count = 0
  @@warehouse = Warehouse.new

  def self.buy_cars
    set_attributes_if_needed
    RobotBuyer.instance.buy_cars
  end

  def set_warehouse warehouse
    @@warehouse = warehouse
  end

  def self.set_attributes_if_needed
    if @@count == 0
      RobotBuyer.instance.order_generator = OrderGenerator.new @@warehouse
      RobotBuyer.instance.logger = ConsoleLogger.new
      @@count += 1
    end
  end

end