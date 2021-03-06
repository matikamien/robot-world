class ElectronicDevices < AssemblyLine

  def execute_action_to_car(car, robot_builder)
    car.assembly_stage_electronic_devices!
    car = add_laser car,robot_builder
    add_computer car,robot_builder
  end

  def add_laser(car, robot_builder)
    laser = robot_builder.create_laser
    laser.update! car:car
    car.parts << laser
    car
  end

  def add_computer(car, robot_builder)
    computer = robot_builder.create_computer
    computer.update! car:car
    car.parts << computer
  end

end


