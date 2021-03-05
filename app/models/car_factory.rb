class CarFactory < ApplicationRecord

  has_many :assembly_lines
  attr_reader :assembly_lines

  def initialize(params = {})
    super
    @assembly_lines = []
    @assembly_lines << BasicStructure.create!(car_factory:self)
    @assembly_lines << ElectronicDevices.create!(car_factory:self)
    @assembly_lines << PaintingAndFinalDetails.create!(car_factory:self)
  end

end
