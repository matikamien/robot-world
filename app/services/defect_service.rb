##
# This class knows how to detect a defect in a car and also can return the defective car parts.

class DefectService

  def car_has_defect car
    get_car_computer(car).car_has_any_defect
  end

  def get_parts_with_defect car
    get_car_computer(car).get_parts_with_defect
  end

  def get_car_computer car
    car.parts.find { |part| part.type == "Computer" }
  end

end
