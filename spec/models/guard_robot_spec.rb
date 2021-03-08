require 'rails_helper'

RSpec.describe GuardRobot, type: :model do

  let(:guard_robot) { GuardRobot.instance }
  let(:notifier) { double("Notifier", :notify => nil ) }
  let(:message_creator) { double("MessageCreator", :create_message => "Testing Message") }

  before(:each) do
    guard_robot.message_creator = message_creator
    guard_robot.notifier_service = notifier
  end

  it "can transfer the stock from factory stock to store stock (only the non-defective cars)" do
    # Adding four cars with defects
    guard_robot.warehouse.park_cars create_cars( true,4)
    # Adding six cars without defects
    guard_robot.warehouse.park_cars create_cars( false, 6)

    expect(guard_robot.warehouse.total_factory_stock).to eq 10
    expect(guard_robot.warehouse.total_store_stock).to eq 0

    guard_robot.transfer_stock_and_notify_defects
    expect(guard_robot.warehouse.total_factory_stock).to eq 4
    expect(guard_robot.warehouse.total_store_stock).to eq 6
  end

  # If @has_defect is true, the car will answer true to has_defect method.
  # @size is the amount of cars that you want to create.
  def create_cars has_defect,size
    cars = []
    size.times do
      car = double("Car", :has_defect => has_defect)
      allow(car).to receive(:id) { 1 }
      cars << car
    end
    cars
  end

end
