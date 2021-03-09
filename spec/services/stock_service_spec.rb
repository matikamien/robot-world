require 'rails_helper'

RSpec.describe StockService, type: :model do

  let(:warehouse) { Warehouse.new }
  let(:stock_service) { StockService.new }

  it "ask for a car and returns true when the car is in the store" do
    car = Car.create!(model: "Corsa", year: 1950, price: 1500, cost_price:1000)
    warehouse.add_cars_to_store [ car ]
    expect(warehouse.total_store_stock).to eq 1

    has_stock = stock_service.has_stock "Corsa"
    expect(has_stock).to be true
  end

  it "ask for a car and returns true when the car is in the factory and has no defects" do
    car = CarCreator.create_with_defect false
    warehouse.park_cars [ car ]
    expect(warehouse.total_factory_stock).to eq 1

    has_stock = stock_service.has_stock "Corsa"
    expect(has_stock).to be true
  end

  it "ask for a car and returns false when the car is in the factory but has a defect" do
    car = CarCreator.create_with_defect true
    warehouse.park_cars [ car ]
    expect(warehouse.total_factory_stock).to eq 1

    has_stock = stock_service.has_stock "Corsa"
    expect(has_stock).to be false
  end

  it "ask for a car and returns false when there is no stocgitk" do
    car = CarCreator.create_with_defect true
    warehouse.park_cars [ car ]
    expect(warehouse.total_factory_stock).to eq 1

    has_stock = stock_service.has_stock "Megane"
    expect(has_stock).to be false
  end

  it "returns a car from the factory and decrement the stock" do
    car = CarCreator.create_with_defect false
    warehouse.park_cars [ car ]
    expect(warehouse.total_factory_stock).to eq 1

    returned_car = stock_service.get_car_from_warehouse "Corsa"
    expect(returned_car.id).to eq car.id
    expect(returned_car.model).to eq "Corsa"
    expect(warehouse.total_factory_stock).to eq 0
  end

  it "returns a car from the store and decrement the stock" do
    car = CarCreator.create_with_defect false
    warehouse.add_cars_to_store [ car ]
    expect(warehouse.total_store_stock).to eq 1

    returned_car = stock_service.get_car_from_warehouse "Corsa"
    expect(returned_car.id).to eq car.id
    expect(returned_car.model).to eq "Corsa"
    expect(warehouse.total_store_stock).to eq 0
  end

end
