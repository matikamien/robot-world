require 'rails_helper'

RSpec.describe CarFactory, type: :model do

  let(:car_factory) { CarFactory.new [BasicStructure.new, ElectronicDevices.new, PaintingAndFinalDetails.new] }

  it "returns a completed car after passing throughout the 3 assembly lines" do
    robot_builder = RobotBuilder.new
    car = robot_builder.create_car
    completed_car = car_factory.construct_car car,robot_builder
    expect(completed_car.is_complete).to be true
  end

end