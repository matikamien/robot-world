class ElectronicDevices < AssemblyLine

  def add_electronic_devices_to_car(car)
    car.parts << Laser.create!(car:car)
    car.parts << Computer.create!(car:car)
  end
end


