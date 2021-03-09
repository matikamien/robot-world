class GuardRobotService

  def self.transfer_stock_and_notify_defects
    notifier_service = SlackNotifierService.new
    message_creator = MessageCreator.new
    GuardRobot.new(notifier_service, message_creator).transfer_stock_and_notify_defects
  end

end
