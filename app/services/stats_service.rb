class StatsService

  def initialize order_service
    @order_service = order_service
  end

  def daily_revenue
    total_daily_revenue = 0
    orders = @order_service.get_orders_from_today

    orders.each do |order|
      car_price = Car.find_by(id:order.car_id).price
      total_daily_revenue += car_price
    end

    total_daily_revenue.round(2)
  end

  def sold_cars
    @order_service.get_orders_from_today.size
  end

  def average_order_value
    (daily_revenue / @order_service.get_orders_from_today.size.to_f).round(2)
  end

end
