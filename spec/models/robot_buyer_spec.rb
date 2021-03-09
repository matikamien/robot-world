require 'rails_helper'

RSpec.describe RobotBuyer, type: :model do

  let(:robot_buyer) { RobotBuyerForTesting.instance }
  let(:console_logger) { double("console_logger") }
  let(:warehouse) { Warehouse.new }
  let(:stock_service) { StockService.new warehouse }
  let(:order_generator) { OrderGenerator.new stock_service }

  before(:each) do
    robot_buyer.order_generator = order_generator
    robot_buyer.logger = console_logger
  end

  it "can buy a car with stock, an order is generated and stock is decremented" do
    car = Car.create!(model: "Corsa", year: 1950, price: 1500, cost_price:1000)
    warehouse.add_cars_to_store [ car ]
    expect(warehouse.total_store_stock).to eq 1

    orders = robot_buyer.buy_cars
    expect(orders.size).to eq 1
    expect(orders[0].car_id).to eq car.id
    expect(warehouse.total_store_stock).to eq 0
  end

  it "tries to buy a car without stock, no orders are generated and event is logged" do
    expect(warehouse.total_store_stock).to eq 0
    expect(console_logger).to receive(:log)

    orders = robot_buyer.buy_cars
    expect(orders.size).to eq 0
    expect(warehouse.total_store_stock).to eq 0
  end

  it "can buy a car from the factory stock when there is no store stock checking that car has no defect" do
    car = CarCreator.create_with_defect false
    warehouse.park_cars [ car ]
    expect(warehouse.total_store_stock).to eq 0
    expect(warehouse.total_factory_stock).to eq 1

    orders = robot_buyer.buy_cars
    expect(orders.size).to eq 1
    expect(orders[0].car_id).to eq car.id
    expect(warehouse.total_store_stock).to eq 0
    expect(warehouse.total_factory_stock).to eq 0
  end

  it "can not buy a car from the factory stock when there is no store stock because the car has a defect" do
    car = CarCreator.create_with_defect true
    warehouse.park_cars [ car ]
    expect(warehouse.total_store_stock).to eq 0
    expect(warehouse.total_factory_stock).to eq 1
    expect(console_logger).to receive(:log)

    orders = robot_buyer.buy_cars
    expect(orders.size).to eq 0
    expect(warehouse.total_store_stock).to eq 0
    expect(warehouse.total_factory_stock).to eq 1
  end

end

class RobotBuyerForTesting < RobotBuyer

  def get_amount_of_cars_to_buy
    1
  end

  def get_model
    "Corsa"
  end

end
