class CarFactory < ApplicationRecord

  has_many :assembly_lines

  def initialize(params = {})
    super
    self.assembly_lines << BasicStructure.create!(car_factory:self)
    self.assembly_lines << ElectronicDevices.create!(car_factory:self)
    self.assembly_lines << PaintingAndFinalDetails.create!(car_factory:self)
  end

end
