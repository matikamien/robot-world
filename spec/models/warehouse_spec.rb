require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  let(:warehouse) { Warehouse.new }

  it "is created with no cars" do
    expect(warehouse.factory_stock.empty?).to eq true
  end

  it "can park cars" do
    cars = []
    10.times { cars << (CarCreator.create_with_model "Corsa") }
    warehouse.park_cars cars
    expect(warehouse.total_factory_stock).to eq 10
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
    7.times { cars << (CarCreator.create_with_model "Corsa") }
    5.times { cars << (CarCreator.create_with_model "Megane") }
    cars
  end

  it "can get a car from store by model" do
    car = CarCreator.create_with_model "Corsa"
    warehouse.add_cars_to_store [car]
    car_from_store = warehouse.get_car_from_store("Corsa")
    expect(car_from_store).to eq car
  end

end
