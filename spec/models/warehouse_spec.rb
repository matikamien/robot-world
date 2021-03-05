require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  let(:warehouse) { Warehouse.new }

  it "is created with no cars" do
    expect(warehouse.cars.empty?).to eq true
  end

  it "can park cars" do
    cars = []
    10.times { cars << Car.new }
    warehouse.park_cars cars
    expect(warehouse.cars.size).to eq 10
  end

  it "can calculate factory stock by model" do
    cars = []
    7.times { cars << Car.new(model:"Corsa") }
    5.times { cars << Car.new(model:"Megane") }
    warehouse.park_cars cars

    corsa_factory_stock = warehouse.factory_stock_by_model "Corsa"
    expect(corsa_factory_stock).to eq 7

    megane_factory_stock = warehouse.factory_stock_by_model "Megane"
    expect(megane_factory_stock).to eq 5
  end

end
