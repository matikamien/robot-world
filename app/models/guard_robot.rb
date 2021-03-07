require 'singleton'

class GuardRobot
  include Singleton

  attr_reader :warehouse

  def initialize
    @warehouse = Warehouse.new
  end

  def transfer_stock
    @warehouse.factory_stock.each do |car|
      if !car.has_defect then
        @warehouse.store_stock << car
      end
    end
    @warehouse.store_stock.each { |car| @warehouse.factory_stock.delete car }
  end

end