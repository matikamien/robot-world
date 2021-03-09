class Order < ApplicationRecord

  validates_presence_of :car_id
  has_many :order_changes

  def was_successful
    true
  end

end
