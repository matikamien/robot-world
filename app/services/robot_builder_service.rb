class RobotBuilderService

  def self.create_ten_cars
    RobotBuilder.new.create_ten_cars
  end

  def self.remove_incomplete_cars
    RobotBuilder.new.remove_incomplete_cars
  end

end
