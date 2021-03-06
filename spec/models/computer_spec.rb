require 'rails_helper'

RSpec.describe Computer, type: :model do

  let(:car) { Car.new }
  let(:computer) { Computer.new }
  let(:seat) { Seat.new }

  before(:each) do
    computer.set_defect NoDefect.new
    computer.car = car
    car.parts << computer
    seat.set_defect ConcreteDefect.new
    car.parts << seat
  end

  it "should know if the car has any defect when it effectively has a defect" do
    expect(computer.car_has_any_defect).to eq true
  end

  it "should know if the car has any defect when it has no defect" do
    seat.set_defect NoDefect.new

    expect(computer.car_has_any_defect).to eq false
  end

  it "should know where is the defect" do
    parts_with_defect = computer.get_parts_with_defect

    expect(parts_with_defect.size).to eq 1
    expect(parts_with_defect.include? seat).to eq true
  end

  it "should know where are the defects when there are more than one" do
    wheel = Wheel.new
    wheel.set_defect ConcreteDefect.new
    car.parts << wheel

    parts_with_defect = computer.get_parts_with_defect

    expect(parts_with_defect.size).to eq 2
    expect(parts_with_defect.include? seat).to eq true
    expect(parts_with_defect.include? wheel).to eq true
  end

end
