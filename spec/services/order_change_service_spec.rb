require 'rails_helper'

RSpec.describe OrderChangeService, type: :model do

  let(:stock_service) { double("stock_service") }
  let(:order_service) { double("order_service", :find_order => Order.new ) }
  let(:order_change_service) { OrderChangeService.new 1, "Corsa", stock_service, order_service}

  it "returns a new order change when there is stock" do
    allow(stock_service).to receive(:has_stock) { true }

    order_change = order_change_service.create_order_change_if_applies

    expect(order_change.order_id).to eq 1
    expect(order_change.car_model).to eq "Corsa"
  end

  it "throws a OrderNotFoundError exception when the order does not exist" do
    allow(order_service).to receive(:find_order) { nil }

    expect {
      order_change_service.create_order_change_if_applies
    }.to raise_error(OrderChangeService::OrderNotFoundError)
  end

  it "throws a NoStockError exception when there is no stock" do
    allow(stock_service).to receive(:has_stock) { false }

    expect {
      order_change_service.create_order_change_if_applies
    }.to raise_error(OrderChangeService::NoStockError)
  end

end
