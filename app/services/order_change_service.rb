##
# This class knows how to check if an order change is valid and is also responsible for creating the order change.

class OrderChangeService

  class OrderNotFoundError < StandardError; end
  class NoStockError < StandardError; end

  def initialize(order_id, car_model, stock_service, order_service)
    @order_id = order_id
    @car_model = car_model
    @stock_service = stock_service
    @order_service = order_service
  end

  def create_order_change_if_applies
    check_order_and_throw_exception_if_applies
    check_stock_and_throw_exception_if_applies
    create_order_change(@order_id, @car_model)
  end

  def check_order_and_throw_exception_if_applies
    order = @order_service.find_order @order_id
    if order.nil?
      raise OrderNotFoundError
    end
  end

  def check_stock_and_throw_exception_if_applies
    unless @stock_service.has_stock(@car_model)
      raise NoStockError
    end
  end

  def create_order_change(order_id, car_model)
    OrderChange.create!(order_id:order_id, car_model:car_model)
  end

end
