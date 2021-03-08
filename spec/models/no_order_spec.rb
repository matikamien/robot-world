require 'rails_helper'

RSpec.describe NoOrder, type: :model do

  let(:no_order) { NoOrder.new }

  it "should return that was not successful" do
    expect(no_order.was_successful).to be false
  end

end

