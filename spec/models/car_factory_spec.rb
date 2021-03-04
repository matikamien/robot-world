require 'rails_helper'

RSpec.describe CarFactory, type: :model do

  describe "Associations" do
    it { should have_many(:assembly_lines) }
  end

  it "should be created with the three assembly lines" do
    car_factory = CarFactory.new
    expect(car_factory.assembly_lines.size).to eq(3)
  end

end