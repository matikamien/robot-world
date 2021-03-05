require 'rails_helper'

RSpec.describe BasicStructure, type: :model do

  subject { described_class.new }

  it "should left the car with the basic structure" do
    car = Car.create!(model: "Corsa", year: 1950, price: 1500, cost_price:1000)
    subject.add_basic_structure_to_car(car)

    amount_of_chassis = car.parts.select { |part| part.type == "Chassis" }.size
    expect(amount_of_chassis).to eq(1)

    amount_of_engines = car.parts.select { |part| part.type == "Engine" }.size
    expect(amount_of_engines).to eq(1)

    amount_of_seats = car.parts.select { |part| part.type == "Seat" }.size
    expect(amount_of_seats).to eq(2)

    amount_of_wheels = car.parts.select { |part| part.type == "Wheel" }.size
    expect(amount_of_wheels).to eq(4)
  end

end