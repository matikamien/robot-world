require 'rails_helper'

RSpec.describe ElectronicDevices, type: :model do

  subject { described_class.new }

  it "should left the car with the electronic devices" do
    car = Car.create!(model: "Corsa", year: 1950, price: 1500, cost_price:1000)
    subject.add_electronic_devices_to_car(car)

    amount_of_lasers = car.parts.select { |part| part.type == "Laser" }.size
    expect(amount_of_lasers).to eq(1)

    amount_of_computers = car.parts.select { |part| part.type == "Computer" }.size
    expect(amount_of_computers).to eq(1)
  end

end
