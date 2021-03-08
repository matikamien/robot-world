class OrderService

  def find_order order_id
    Order.find_by(id:order_id)
  end

end
