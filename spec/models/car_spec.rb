require 'rails_helper'

RSpec.describe Car, type: :model do

  let(:car) { CarCreator.create_car "Nissan Tida" }

  describe "Associations" do
    it { should have_many(:parts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:cost_price) }
  end

  it "is valid with valid attributes" do
    expect(car).to be_valid
  end

  it "is not valid without a model" do
    car.model = nil
    expect(car).to_not be_valid
  end

  it "is not valid without a year" do
    car.year = nil
    expect(car).to_not be_valid
  end

  it "is not valid without a price" do
    car.price = nil
    expect(car).to_not be_valid
  end

  it "is not valid without a cost_price" do
    car.cost_price = nil
    expect(car).to_not be_valid
  end

  it "has many parts" do
    should respond_to(:parts)
  end

  it "is not complete in basic structure assembly stage" do
    car.assembly_stage_basic_structure!
    expect(car.is_complete).to eq(false)
  end

  it "is not complete in electronic devices assembly stage" do
    car.assembly_stage_electronic_devices!
    expect(car.is_complete).to eq(false)
  end

  it "is not complete in painting and final details assembly stage" do
    car.assembly_stage_painting_and_final_details!
    expect(car.is_complete).to eq(false)
  end

  it "is is complete in complete assembly stage" do
    car.assembly_stage_completed!
    expect(car.is_complete).to eq(true)
  end

end
