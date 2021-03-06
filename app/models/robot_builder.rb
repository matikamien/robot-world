class RobotBuilder

  attr_reader :car_factory
  attr_writer :defect_probability

  CAR_MODELS = %w[Megane Tida Corsa March Up Gol Polo Fun Golf Vento]
  CAR_PRICES = [ 10000, 25000, 7500, 12800, 30000, 50000 ]
  DEFECT_PROBABILITY = 0.03

  def initialize
    @car_factory = CarFactory.create!
    @warehouse = Warehouse.new
    @defect_probability = DEFECT_PROBABILITY
  end

  def create_car_and_park_in_warehouse
    car = create_car
    ccmpleted_car = construct_car car
    park_car_in_warehouse ccmpleted_car
  end

  def create_car
    price = random_price
    Car.create! year: current_year, model: random_model, price: price, cost_price: calculate_cost_price(price)
  end

  def construct_car(car)
    @car_factory.assembly_lines.each { |assembly_line| assembly_line.execute_action_to_car(car, self)  }
    car.assembly_stage_completed!
    car
  end

  def park_car_in_warehouse(car)
    @warehouse.park_car car
    car
  end

  def current_year
    Time.new.year
  end

  def random_model
    CAR_MODELS[rand(10)]
  end

  def random_price
    CAR_PRICES[rand(6)]
  end

  def calculate_cost_price(price)
    0.5*price
  end

  def create_defect
    # random will be a number between 1 and 100 (inclusive)
    random = rand(100) + 1

    if random <= @defect_probability*100
      ConcreteDefect.new
    else
      NoDefect.new
    end
  end

  def create_wheel
    wheel = Wheel.new
    wheel.set_defect create_defect
    wheel
  end

  def create_chassis
    chassis = Chassis.new
    chassis.set_defect create_defect
    chassis
  end

  def create_engine
    engine = Engine.new
    engine.set_defect create_defect
    engine
  end

  def create_seat
    seat = Seat.new
    seat.set_defect create_defect
    seat
  end

  def create_laser
    laser = Laser.new
    laser.set_defect create_defect
    laser
  end

  def create_computer
    computer = Computer.new
    computer.set_defect create_defect
    computer
  end

  def total_factory_stock
    @warehouse.total_factory_stock
  end

end
