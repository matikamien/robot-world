require 'rails_helper'

RSpec.describe Car, type: :model do

  subject {
    described_class.new(year: 2021,
                        model: "Nissan Tida",
                        price: 150,
                        cost_price: 100)
  }

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
    expect(subject).to be_valid
  end

  it "is not valid without a model" do
    subject.model = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a year" do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cost_price" do
    subject.cost_price = nil
    expect(subject).to_not be_valid
  end

  it "has many parts" do
    should respond_to(:parts)
  end

end
