##
# This class knows how to create the stats JSON.

class JsonCreatorService

  def generate_output daily_revenue,sold_cars,average_order_value
    { daily_revenue: daily_revenue,
      sold_cars: sold_cars,
      average_order_value: average_order_value }
  end
end
