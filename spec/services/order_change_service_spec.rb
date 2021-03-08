require 'rails_helper'

RSpec.describe OrderChangeService, type: :model do

  let(:stock_service) { double("stock_service") }
  let(:order_change_service) { OrderChangeService.new 1, "Corsa", stock_service}

  it "returns a new order change when there is stock" do
    allow(stock_service).to receive(:has_stock) { true }

    order_change = order_change_service.create_order_change_if_applies

    expect(order_change.order_id).to eq 1
    expect(order_change.car_model).to eq "Corsa"
  end

  it "returns nil when there is no stock" do
    allow(stock_service).to receive(:has_stock) { false }

    order_change = order_change_service.create_order_change_if_applies
    expect(order_change).to eq nil
  end

end
