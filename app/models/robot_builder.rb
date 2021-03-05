class RobotBuilder

  attr_reader :car_factory

  def initialize
    @car_factory = CarFactory.create!
  end

  def create_car
    car = Car.create! year: 2021, model: "Nissan Tida", price: 150, cost_price: 100
    @car_factory.assembly_lines.each { |assembly_line| assembly_line.execute_action_to_car car }
    car.assembly_stage_completed!
    car
  end

end
