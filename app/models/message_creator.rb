class MessageCreator

  def create_message car
    message = "The car with id " + car.id.to_s + " has defects in the following parts: "
    parts_with_defect = car.get_parts_with_defect
    parts_with_defect.each { |part| message += (part.to_s + ' with id ' + part.id.to_s + ', ') }
    message = message[0...message.length-2]
    message += '.'
    message
  end

end
