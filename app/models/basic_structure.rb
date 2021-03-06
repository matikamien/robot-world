class BasicStructure < AssemblyLine

  def execute_action_to_car(car, robot_builder)
    car.assembly_stage_basic_structure!
    car = add_wheels car,robot_builder
    car = add_chassis car,robot_builder
    car = add_engine car,robot_builder
    add_seats car,robot_builder
  end

  def add_wheels(car, robot_builder)
    4.times do
      wheel = robot_builder.create_wheel
      wheel.update! car:car
      wheel.save!
      car.parts << wheel
    end
    car
  end

  def add_chassis(car, robot_builder)
    chassis = robot_builder.create_chassis
    chassis.update! car:car
    chassis.save!
    car.parts << chassis
    car
  end

  def add_engine(car, robot_builder)
    engine = robot_builder.create_engine
    engine.update! car:car
    engine.save!
    car.parts << engine
    car
  end

  def add_seats(car, robot_builder)
    2.times do
      seat = robot_builder.create_seat
      seat.update! car:car
      seat.save!
      car.parts << seat
    end
  end

end

