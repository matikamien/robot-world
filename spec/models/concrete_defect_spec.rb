require 'rails_helper'

RSpec.describe ConcreteDefect, type: :model do

  let(:concrete_defect) { ConcreteDefect.new }

  it "should be a defect" do
    expect(concrete_defect.is_defect).to eq true
  end

end
