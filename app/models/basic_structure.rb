class BasicStructure < AssemblyLine

  def add_basic_structure_to_car(car)
    4.times {car.parts << Wheel.create!(car:car) }
    car.parts << Chassis.create!(car:car)
    car.parts << Engine.create!(car:car)
    2.times {car.parts << Seat.create!(car:car) }
  end

end

