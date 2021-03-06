require 'rails_helper'

RSpec.describe Computer, type: :model do

  let(:car) { Car.new }
  let(:computer) { Computer.new }

  before(:each) do
    computer.set_defect NoDefect.new
    computer.car = car
    car.parts << computer
  end

  it "should know if the car has any defect when it effectively has a defect" do
    seat = Seat.new
    seat.set_defect ConcreteDefect.new
    car.parts << seat

    expect(computer.car_has_any_defect).to eq true
  end

  it "should know if the car has any defect when it has no defect" do
    seat = Seat.new
    seat.set_defect NoDefect.new
    car.parts << seat

    expect(computer.car_has_any_defect).to eq false
  end

end
