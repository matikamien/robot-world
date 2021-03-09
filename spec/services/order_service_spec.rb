require 'rails_helper'

RSpec.describe OrderService, type: :model do

  let(:order_service) { OrderService.new }

  it "should return orders from today" do
    now = Time.zone.now
    2.times {create_order now}
    create_order now-1.day

    orders = order_service.get_orders_from_today

    expect(orders.size).to eq 2
  end

  def create_order date
    Order.create! car_id:1,created_at:date
  end

end
