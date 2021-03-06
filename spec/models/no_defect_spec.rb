require 'rails_helper'

RSpec.describe NoDefect, type: :model do

  let(:no_defect) { NoDefect.new }

  it "should not be a defect" do
    expect(no_defect.is_defect).to eq false
  end

end
