class RobotBuilder

  attr_reader :car_factory

  CAR_MODELS = %w[Megane Tida Corsa March Up Gol Polo Fun Golf Vento]
  CAR_PRICES = [ 10000, 25000, 7500, 12800, 30000, 50000 ]

  def initialize
    @car_factory = CarFactory.create!
  end

  def create_car
    price = random_price
    car = Car.create! year: current_year, model: random_model, price: price, cost_price: calculate_cost_price(price)
    @car_factory.assembly_lines.each { |assembly_line| assembly_line.execute_action_to_car(car, self)  }
    car.assembly_stage_completed!
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

  def create_wheel(car)
    Wheel.create!(car:car)
  end

  def create_chassis(car)
    Chassis.create!(car:car)
  end

  def create_engine(car)
    Engine.create!(car:car)
  end

  def create_seat(car)
    Seat.create!(car:car)
  end

  def create_laser(car)
    Laser.create!(car:car)
  end

  def create_computer(car)
    Computer.create!(car:car)
  end

end
