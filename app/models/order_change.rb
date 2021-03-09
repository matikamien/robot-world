class OrderChange < ApplicationRecord

  validates_presence_of :order_id, :car_model
  belongs_to :order

end
