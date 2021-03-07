require 'rails_helper'

RSpec.describe CarFactory, type: :model do

  let(:car_factory) { CarFactory.new }

  describe "Associations" do
    it { should have_many(:assembly_lines) }
  end

  it "should be created with the three assembly lines" do
    expect(car_factory.assembly_lines.size).to eq(3)
  end

  it "should be created with one Basic Structure" do
    amount_of_basic_structures = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "BasicStructure" }.size
    expect(amount_of_basic_structures).to eq(1)
  end

  it "should be created with one Electronic Devices" do
    amount_of_electronic_devices = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "ElectronicDevices" }.size
    expect(amount_of_electronic_devices).to eq(1)
  end

  it "should be created with one Painting And Final Details" do
    amount_of_painting_and_final_details = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "PaintingAndFinalDetails" }.size
    expect(amount_of_painting_and_final_details).to eq(1)
  end

  it "returns a completed car after passing throughout the 3 assembly lines" do
    robot_builder = RobotBuilder.instance
    car = robot_builder.create_car
    completed_car = car_factory.construct_car car,robot_builder
    expect(completed_car.is_complete).to be true
  end

end