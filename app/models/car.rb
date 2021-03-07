class Car < ApplicationRecord

  validates_presence_of :model, :year, :price, :cost_price
  has_many :parts

  enum assembly_stage: { basic_structure: 0,
                         electronic_devices: 1,
                         painting_and_final_details: 2,
                         completed: 3 }, _prefix: :assembly_stage

  def is_complete
    self.assembly_stage_completed?
  end

  def current_assembly_stage
    self.assembly_stage
  end

  # It should return an error if computer is not found.
  def has_defect
    computer = parts.find { |part| part.type == "Computer" }
    computer.car_has_any_defect
  end

end
