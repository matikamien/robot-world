##
# This class knows how to instantiate a Guard Robot.

class GuardRobotService

  def self.transfer_stock_and_notify_defects
    notifier_service = SlackNotifierService.new
    defect_service = DefectService.new
    message_creator_service = MessageCreatorService.new defect_service
    defect_service = DefectService.new
    GuardRobot.new(notifier_service, message_creator_service, defect_service).transfer_stock_and_notify_defects
  end

end
