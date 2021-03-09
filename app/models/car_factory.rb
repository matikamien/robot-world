class CarFactory

  def initialize assembly_lines
    @assembly_lines = assembly_lines
  end

  def construct_car(car, robot_builder)
    @assembly_lines.each { |assembly_line| assembly_line.execute_action_to_car(car, robot_builder)  }
    car.assembly_stage_completed!
    car
  end

end
