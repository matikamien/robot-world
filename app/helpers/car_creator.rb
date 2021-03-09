class CarCreator

  def self.create_with_defect has_defect
    car = create_car "Corsa"
    wheel = Wheel.create!(car:car, defect:create_defect(has_defect))
    computer = Computer.create!(car:car, defect:NoDefect.new)
    car.parts << wheel
    car.parts << computer
    car
  end

  def self.create_defect has_defect
    if has_defect
      return ConcreteDefect.new
    else
      return NoDefect.new
    end
  end

  def self.create_with_model model
    create_car model
  end

  def self.create_car model
    Car.create!(model: model, year: 1950, price: 1500, cost_price:1000)
  end

end
