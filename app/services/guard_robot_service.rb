class GuardRobotService

  @@count = 0

  def self.transfer_stock_and_notify_defects
    set_attributes_if_needed
    GuardRobot.instance.transfer_stock_and_notify_defects
  end

  def self.set_attributes_if_needed
    if @@count == 0
      GuardRobot.instance.notifier_service = SlackNotifierService.new
      GuardRobot.instance.message_creator = MessageCreator.new
      @@count += 1
    end
  end

end
