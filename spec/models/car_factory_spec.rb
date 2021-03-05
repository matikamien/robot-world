require 'rails_helper'

RSpec.describe CarFactory, type: :model do

  describe "Associations" do
    it { should have_many(:assembly_lines) }
  end

  it "should be created with the three assembly lines" do
    car_factory = CarFactory.new
    expect(car_factory.assembly_lines.size).to eq(3)
  end

  it "should be created with one Basic Structure" do
    car_factory = CarFactory.new
    amount_of_basic_structures = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "BasicStructure" }.size
    expect(amount_of_basic_structures).to eq(1)
  end

  it "should be created with one Electronic Devices" do
    car_factory = CarFactory.new
    amount_of_electronic_devices = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "ElectronicDevices" }.size
    expect(amount_of_electronic_devices).to eq(1)
  end

  it "should be created with one Painting And Final Details" do
    car_factory = CarFactory.new
    amount_of_painting_and_final_details = car_factory.assembly_lines.select { |assembly_line| assembly_line.type == "PaintingAndFinalDetails" }.size
    expect(amount_of_painting_and_final_details).to eq(1)
  end

end