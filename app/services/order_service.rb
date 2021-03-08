class OrderService

  def find_order order_id
    Order.find_by(id:order_id)
  end

  def get_orders_from_today
    Order.all.select do |order|
      order.created_at.day == Date.today.day &&
        order.created_at.month == Date.today.month &&
        order.created_at.year == Date.today.year
    end
  end

end
