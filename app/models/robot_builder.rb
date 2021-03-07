require 'singleton'

class RobotBuilder
  include Singleton

  attr_reader :warehouse, :car_factory, :cars
  attr_writer :defect_probability

  CAR_MODELS = %w[Megane Tida Corsa March Up Gol Polo Fun Golf Vento]
  CAR_PRICES = [ 10000, 25000, 7500, 12800, 30000, 50000 ]
  DEFECT_PROBABILITY = 0.03

  def initialize
    @car_factory = CarFactory.create!
    @warehouse = Warehouse.new
    @defect_probability = DEFECT_PROBABILITY
    @cars = []
  end

  def self.create_ten_cars
    robot_builder = self.instance
    10.times do
      car = robot_builder.create_car
      constructed_car = robot_builder.car_factory.construct_car(car, robot_builder)
      robot_builder.park_car_in_warehouse(constructed_car)
    end
  end

  def self.remove_incomplete_cars
    self.instance.remove_incomplete_cars
  end

  def remove_incomplete_cars
    @cars.delete_if { |car| !car.is_complete }
  end

  def create_car
    price = random_price
    car = Car.create! year: current_year, model: random_model, price: price, cost_price: calculate_cost_price(price)
    @cars << car
    car
  end

  def park_car_in_warehouse(car)
    @warehouse.park_car car
    @cars.delete car
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
