class Order < ApplicationRecord

  validates_presence_of :car_id

  def was_successful
    true
  end

end
