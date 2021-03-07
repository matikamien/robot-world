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

  def construct_car(car, robot_builder)
    @assembly_lines.each { |assembly_line| assembly_line.execute_action_to_car(car, robot_builder)  }
    car.assembly_stage_completed!
    car
  end

end
