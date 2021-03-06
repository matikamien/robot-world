require 'rails_helper'

RSpec.describe RobotBuilder, type: :model do

  let(:robot_builder) { RobotBuilder.new }
  let(:car) { Car.new }

  it "is created with a car factory" do
    expect(robot_builder.car_factory).to be_a(CarFactory)
  end

  it "can create a complete car after going to the car factory" do
    car = robot_builder.create_car
    completed_car = robot_builder.construct_car car
    expect(completed_car.is_complete).to be true
  end

  it "can create a wheel" do
    wheel = robot_builder.create_wheel
    expect(wheel).to be_a(Wheel)
  end

  it "can create a chassis" do
    chassis = robot_builder.create_chassis
    expect(chassis).to be_a(Chassis)
  end

  it "can create a engine" do
    engine = robot_builder.create_engine
    expect(engine).to be_a(Engine)
  end

  it "can create a seat" do
    seat = robot_builder.create_seat
    expect(seat).to be_a(Seat)
  end

  it "can create a laser" do
    laser = robot_builder.create_laser
    expect(laser).to be_a(Laser)
  end

  it "can create a computer" do
    computer = robot_builder.create_computer
    expect(computer).to be_a(Computer)
  end

  it "should park the cars in the warehouse once are complete" do
    expect(robot_builder.total_factory_stock).to eq 0

    car = robot_builder.create_car_and_park_in_warehouse
    expect(car.is_complete).to be true
    expect(robot_builder.total_factory_stock).to eq 1
  end

end
