require 'rails_helper'

RSpec.describe GuardRobot, type: :model do

  let(:notifier) { double("Notifier", :notify => nil ) }
  let(:message_creator_service) { double("MessageCreator", :create_message => "Testing Message") }
  let(:defect_service) { DefectService.new }
  let(:guard_robot) { GuardRobot.new(notifier, message_creator_service, defect_service) }
  let(:warehouse) { Warehouse.new }

  it "can transfer the stock from factory stock to store stock (only the non-defective cars)" do
    # Adding four cars with defects
    warehouse.park_cars CarCreator.create_cars_with_defects( true,4)
    # Adding six cars without defects
    warehouse.park_cars CarCreator.create_cars_with_defects( false, 6)

    expect(warehouse.total_factory_stock).to eq 10
    expect(warehouse.total_store_stock).to eq 0

    guard_robot.transfer_stock_and_notify_defects
    expect(warehouse.total_factory_stock).to eq 4
    expect(warehouse.total_store_stock).to eq 6
  end

end
