##
# This class knows how to create the message to notify when a car has defect.

class MessageCreatorService

  def initialize defect_service
    @defect_service = defect_service
  end

  def create_message car
    message = "The car with id " + car.id.to_s + " has defects in the following parts: "
    parts_with_defect = @defect_service.get_parts_with_defect
    parts_with_defect.each { |part| message += (part.to_s + ' with id ' + part.id.to_s + ', ') }
    message = message[0...message.length-2]
    message += '.'
    message
  end

end
