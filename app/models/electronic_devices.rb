class ElectronicDevices < AssemblyLine

  def execute_action_to_car(car)
    car.assembly_stage_electronic_devices!
    car.parts << Laser.create!(car:car)
    car.parts << Computer.create!(car:car)
  end
end


