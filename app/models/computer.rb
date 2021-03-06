class Computer < Part

  def car_has_any_defect
    self.car.parts.any? { |part| part.has_defect }
  end

  def get_parts_with_defect
    self.car.parts.select { |part| part.has_defect }
  end

end
