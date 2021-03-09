class GuardRobot

  def initialize notifier_service,message_creator_service,defect_service
    @notifier_service = notifier_service
    @message_creator_service = message_creator_service
    @defect_service = defect_service
  end

  def transfer_stock_and_notify_defects
    get_warehouse.factory_stock.each do |car|
      if !@defect_service.car_has_defect(car)
        car.location_store_stock!
      else
        notify_defect car
      end
    end
  end

  def notify_defect car
    @notifier_service.notify @message_creator_service.create_message(car)
  end

  def get_warehouse
    Warehouse.new
  end

end