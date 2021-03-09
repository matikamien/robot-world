require 'rails_helper'

RSpec.describe OrderChange, type: :model do

  let(:order_change) { OrderChange.new }

  describe "Validations" do
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:car_model) }
    it { should belong_to(:order) }
  end

end
