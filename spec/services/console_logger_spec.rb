require 'rails_helper'

RSpec.describe ConsoleLogger, type: :model do

  let(:console_logger) { ConsoleLogger.new }
  let(:order) { double("order") }

  before(:each) do
    allow(order).to receive(:model) { "Corsa" }
  end

  it "should log the message in the console" do
    expected_logged_message = "Error when trying to create an order to buy a Corsa because lack of stock."

    expect do
      console_logger.log(order)
    end.to output(expected_logged_message).to_stdout
  end

end
