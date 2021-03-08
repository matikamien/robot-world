require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  let(:warehouse) { Warehouse.new }

  it "is created with no cars" do
    expect(warehouse.factory_stock.empty?).to eq true
  end

  it "can park cars" do
    cars = []
    10.times { cars << Car.new }
    warehouse.park_cars cars
    expect(warehouse.factory_stock.size).to eq 10
  end

  it "can calculate factory stock by model" do
    warehouse.park_cars create_cars

    corsa_factory_stock = warehouse.factory_stock_by_model "Corsa"
    expect(corsa_factory_stock).to eq 7

    megane_factory_stock = warehouse.factory_stock_by_model "Megane"
    expect(megane_factory_stock).to eq 5
  end

  it "can add cars to store" do
    warehouse.add_cars_to_store create_cars
    expect(warehouse.total_store_stock).to be 12
  end

  it "can calculate store stock by model" do
    warehouse.add_cars_to_store create_cars

    corsa_store_stock = warehouse.store_stock_by_model "Corsa"
    expect(corsa_store_stock).to eq 7

    megane_store_stock = warehouse.store_stock_by_model "Megane"
    expect(megane_store_stock).to eq 5
  end

  def create_cars
    cars = []
    7.times { cars << create_car("Corsa") }
    5.times { cars << create_car("Megane") }
    cars
  end

  def create_car model
    Car.new(model:model)
  end

  it "can get a car from store" do
    car = create_car("Corsa")
    warehouse.add_cars_to_store [car]
    car_from_store = warehouse.get_car_from_store("Corsa")
    expect(car_from_store).to be car
  end

  it "can decrement store" do
    car = create_car("Corsa")
    warehouse.add_cars_to_store [car]
    expect(warehouse.total_store_stock).to be 1

    warehouse.decrement_store_stock car
    expect(warehouse.total_store_stock).to be 0
  end

end
