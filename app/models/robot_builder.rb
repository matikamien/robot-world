class RobotBuilder

  attr_writer :defect_probability

  CAR_MODELS = %w[Megane Tida Corsa March Up Gol Polo Fun Golf Vento]
  CAR_PRICES = [ 10000, 25000, 7500, 12800, 30000, 50000 ]
  DEFECT_PROBABILITY = 0.03

  def initialize
    @car_factory = CarFactory.create!
    @warehouse = Warehouse.new
    @defect_probability = DEFECT_PROBABILITY
  end

  def create_ten_cars
    10.times do
      car = create_car
      constructed_car = @car_factory.construct_car(car, self)
      park_car_in_warehouse(constructed_car)
    end
  end

  def cars_in_construction
    Car.all.select{ |car| car.location_in_construction? }
  end

  def in_construction_and_incomplete_cars
    Car.all.select{ |car| car.location_in_construction? && !car.is_complete}
  end

  def remove_incomplete_cars
    in_construction_and_incomplete_cars.each do |car|
      car.destroy
    end
  end

  def create_car
    price = random_price
    car = Car.create! year: current_year, model: random_model, price: price, cost_price: calculate_cost_price(price)
    car.location_in_construction!
    car
  end

  def park_car_in_warehouse(car)
    @warehouse.park_car car
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
