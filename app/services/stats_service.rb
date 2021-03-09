##
# This class knows how to calculate stats.

class StatsService

  def initialize order_service,output_creator
    @order_service = order_service
    @output_creator = output_creator
  end

  def get_stats
    orders = @order_service.get_orders_from_today
    total_orders = orders.size

    daily_revenue = daily_revenue orders
    sold_cars = total_orders
    average_order_value = (daily_revenue/total_orders.to_f).round(2)

    @output_creator.generate_output daily_revenue,sold_cars,average_order_value
  end

  def daily_revenue orders
    total_daily_revenue = 0

    orders.each do |order|
      car_price = Car.find_by(id:order.car_id).price
      total_daily_revenue += car_price
    end

    total_daily_revenue.round(2)
  end

end
