require 'rails_helper'

RSpec.describe OrderService, type: :model do

  let(:order_service) { OrderService.new }

  it "should return orders from today" do
    2.times {create_order Date.today}
    create_order Date.yesterday

    orders = order_service.get_orders_from_today

    expect(orders.size).to eq 2
  end

  def create_order date
    Order.create! car_id:1,created_at:date
  end

end
