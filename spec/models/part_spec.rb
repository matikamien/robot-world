require 'rails_helper'

RSpec.describe Part, type: :model do

  describe "Associations" do
    it { should belong_to(:car) }
  end

  describe "Validations" do
    it { should validate_presence_of(:car) }
  end

end
