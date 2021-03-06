class Car < ApplicationRecord

  validates_presence_of :model, :year, :price, :cost_price
  has_many :parts

  enum assembly_stage: {
    basic_structure: 0,
    electronic_devices: 1,
    painting_and_final_details: 2,
    completed: 3
  }, _prefix: :assembly_stage

  enum location: {
    in_construction: 0,
    factory_stock: 1,
    store_stock: 2,
    sold: 3
  }, _prefix: :location

  def is_complete
    self.assembly_stage_completed?
  end

end
