##
# This class knows how to get orders from database.

class OrderService

  def find_order order_id
    Order.find_by(id:order_id)
  end

  def get_orders_from_today
    Order.all.select do |order|
      order.created_at.day == Time.zone.now.day &&
        order.created_at.month == Time.zone.now.month &&
        order.created_at.year == Time.zone.now.year
    end
  end

end
