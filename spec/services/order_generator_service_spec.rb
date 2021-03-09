require 'rails_helper'

RSpec.describe OrderGeneratorService, type: :model do

  let(:stock_service) { double("StockService") }
  let(:order_generator) { OrderGeneratorService.new stock_service }

  it "creates a valid order when there is stock" do
    mock_stock_service_with_stock

    order = order_generator.generate_order "Corsa"

    expect(order).to be_a(Order)
    expect(order.car_id).to be 1
  end

  it "creates an invalid order when there is no stock" do
    allow(stock_service).to receive(:has_stock) {false}

    order = order_generator.generate_order "Corsa"

    expect(order).to be_a(NoOrder)
  end

  def mock_stock_service_with_stock
    car = double("car", :id => 1)
    allow(stock_service).to receive(:has_stock) {true}
    allow(stock_service).to receive(:get_car_from_warehouse) {car}
  end

end
