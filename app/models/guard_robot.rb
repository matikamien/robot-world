class GuardRobot

  def initialize notifier_service,message_creator
    @notifier_service = notifier_service
    @message_creator = message_creator
  end

  def transfer_stock_and_notify_defects
    get_warehouse.factory_stock.each do |car|
      if !car.has_defect
        car.location_store_stock!
      else
        notify_defect car
      end
    end
  end

  def notify_defect car
    @notifier_service.notify @message_creator.create_message(car)
  end

  def get_warehouse
    Warehouse.new
  end

end