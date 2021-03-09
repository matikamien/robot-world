require 'rails_helper'

RSpec.describe RobotBuilder, type: :model do

  let(:robot_builder) { RobotBuilder.new }
  let(:car) { CarCreator.create_car "Corsa" }

  it "can create a wheel" do
    wheel = robot_builder.create_wheel car
    expect(wheel).to be_a(Wheel)
  end

  it "can create a chassis" do
    chassis = robot_builder.create_chassis car
    expect(chassis).to be_a(Chassis)
  end

  it "can create a engine" do
    engine = robot_builder.create_engine car
    expect(engine).to be_a(Engine)
  end

  it "can create a seat" do
    seat = robot_builder.create_seat car
    expect(seat).to be_a(Seat)
  end

  it "can create a laser" do
    laser = robot_builder.create_laser car
    expect(laser).to be_a(Laser)
  end

  it "can create a computer" do
    computer = robot_builder.create_computer car
    expect(computer).to be_a(Computer)
  end

  it "should park the cars in the warehouse once are complete" do
    expect(robot_builder.total_factory_stock).to eq 0

    robot_builder.create_ten_cars
    expect(robot_builder.total_factory_stock).to eq 10
  end

  it "can create a part with a defect" do
    robot_builder.defect_probability = 1
    wheel = robot_builder.create_wheel car
    expect(wheel.has_defect).to eq true
  end

  it "can remove incomplete cars" do
    incomplete_car = robot_builder.create_car
    complete_car = robot_builder.create_car
    complete_car.assembly_stage_completed!
    expect(robot_builder.cars_in_construction.size).to eq 2

    robot_builder.remove_incomplete_cars
    expect(robot_builder.cars_in_construction.size).to eq 1
    expect(robot_builder.cars_in_construction.first).to eq complete_car
  end

end
