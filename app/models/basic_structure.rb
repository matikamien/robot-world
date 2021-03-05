class BasicStructure < AssemblyLine

  def execute_action_to_car(car)
    car.assembly_stage_basic_structure!
    4.times {car.parts << Wheel.create!(car:car) }
    car.parts << Chassis.create!(car:car)
    car.parts << Engine.create!(car:car)
    2.times {car.parts << Seat.create!(car:car) }
  end

end

