require 'singleton'

class GuardRobot
  include Singleton

  attr_reader :warehouse
  attr_writer :notifier_service, :message_creator

  def initialize
    @warehouse = Warehouse.new
  end

  def transfer_stock_and_notify_defects
    @warehouse.factory_stock.each do |car|
      if !car.has_defect
        @warehouse.store_stock << car
      else
        notify_defect car
      end
    end
    @warehouse.store_stock.each { |car| @warehouse.factory_stock.delete car }
  end

  def notify_defect car
    @notifier_service.notify @message_creator.create_message(car)
  end

end