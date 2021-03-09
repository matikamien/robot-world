class ConsoleLoggerService

  def log order
    print "Error when trying to create an order to buy a " + order.model + " because lack of stock."
  end

end
