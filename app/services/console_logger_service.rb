##
# This class knows how to log the error when the order could not be created due to lack of stock.

class ConsoleLoggerService

  def log order
    print "Error when trying to create an order to buy a " + order.model + " because lack of stock."
  end

end
