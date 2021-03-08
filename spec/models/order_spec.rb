require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order) { Order.new }

  describe "Validations" do
    it { should validate_presence_of(:car_id) }
  end

  it "should return that was successful" do
    expect(order.was_successful).to be true
  end

end
