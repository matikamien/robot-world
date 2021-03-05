class ElectronicDevices < AssemblyLine

  def execute_action_to_car(car, robot_builder)
    car.assembly_stage_electronic_devices!
    car.parts << robot_builder.create_laser(car)
    car.parts << robot_builder.create_computer(car)
  end
end


