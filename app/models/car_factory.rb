class CarFactory < ApplicationRecord

  has_many :assembly_lines

  def initialize(params = {})
    super
    @assembly_lines = [ BasicStructure.new, ElectronicDevices.new, PaintingAndFinalDetails.new ]
  end

  def assembly_lines
    @assembly_lines
  end

end
