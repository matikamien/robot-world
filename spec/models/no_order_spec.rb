require 'rails_helper'

RSpec.describe NoOrder, type: :model do

  let(:no_order) { NoOrder.new "Corsa" }

  it "should return that was not successful" do
    expect(no_order.was_successful).to be false
  end

  it "should return the model" do
    expect(no_order.model).to be == "Corsa"
  end

end

