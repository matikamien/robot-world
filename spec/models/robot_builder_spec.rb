require 'rails_helper'

RSpec.describe RobotBuilder, type: :model do

  it "is created with a car factory" do
    robot_builder = RobotBuilder.new
    expect(robot_builder.car_factory).to be_a(CarFactory)
  end

  it "can create a complete car" do
    robot_builder = RobotBuilder.new
    car = robot_builder.create_car
    expect(car.is_complete).to be true
  end

end
