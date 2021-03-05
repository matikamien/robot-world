class BasicStructure < AssemblyLine

  def execute_action_to_car(car, robot_builder)
    car.assembly_stage_basic_structure!
    4.times {car.parts << robot_builder.create_wheel(car) }
    car.parts << robot_builder.create_chassis(car)
    car.parts << robot_builder.create_engine(car)
    2.times {car.parts << robot_builder.create_seat(car) }
  end

end

