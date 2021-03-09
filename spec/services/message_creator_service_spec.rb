require 'rails_helper'

RSpec.describe MessageCreatorService, type: :model do

  let(:car) { CarCreator.create_with_defect true }
  let(:defect_service) { DefectService.new }
  let(:message_creator_service) { MessageCreatorService.new defect_service }

  it "should create the message" do
    expected_message = "The car with id " + car.id.to_s + " has defects in the following parts: Wheel."
    created_message = message_creator_service.create_message car

    expect(created_message).to eq expected_message
  end

end
