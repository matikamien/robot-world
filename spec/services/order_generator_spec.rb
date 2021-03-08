require 'rails_helper'

RSpec.describe OrderGenerator, type: :model do

  let(:warehouse) { double("Warehouse") }
  let(:order_generator) { OrderGenerator.new warehouse }

  it "creates a valid order when there is stock" do
    mock_warehouse_with_stock
    order = order_generator.generate_order "Corsa"
    expect(order).to be_a(Order)
    expect(order.car_id).to be 1
  end

  it "creates an invalid order when there is no stock" do
    mock_warehouse_without_stock
    order = order_generator.generate_order "Corsa"
    expect(order).to be_a(NoOrder)
  end

  def mock_warehouse_with_stock
    car = double("car", :id => 1)
    allow(warehouse).to receive(:store_stock_by_model) { 1 }
    allow(warehouse).to receive(:get_car_from_store) { car }
    expect(warehouse).to receive(:decrement_store_stock) { car }
  end

  def mock_warehouse_without_stock
    allow(warehouse).to receive(:store_stock_by_model) { 0 }
  end

end
