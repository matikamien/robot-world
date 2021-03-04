require 'rails_helper'

RSpec.describe AssemblyLine, type: :model do

  describe "Associations" do
    it { should belong_to(:car_factory) }
  end

  describe "Validations" do
    it { should validate_presence_of(:car_factory) }
  end

end