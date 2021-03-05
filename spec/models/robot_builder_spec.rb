require 'rails_helper'

RSpec.describe RobotBuilder, type: :model do

  let(:robot_builder) { RobotBuilder.new }
  let(:car) { Car.new }

  it "is created with a car factory" do
    expect(robot_builder.car_factory).to be_a(CarFactory)
  end

  it "can create a complete car" do
    car = robot_builder.create_car
    expect(car.is_complete).to be true
  end

  it "can create a wheel" do
    wheel = robot_builder.create_wheel(car)
    expect(wheel).to be_a(Wheel)
  end

  it "can create a chassis" do
    chassis = robot_builder.create_chassis(car)
    expect(chassis).to be_a(Chassis)
  end

  it "can create a engine" do
    engine = robot_builder.create_engine(car)
    expect(engine).to be_a(Engine)
  end

  it "can create a seat" do
    seat = robot_builder.create_seat(car)
    expect(seat).to be_a(Seat)
  end

  it "can create a laser" do
    laser = robot_builder.create_laser(car)
    expect(laser).to be_a(Laser)
  end

  it "can create a computer" do
    computer = robot_builder.create_computer(car)
    expect(computer).to be_a(Computer)
  end
end
