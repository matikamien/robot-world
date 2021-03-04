class Car < ApplicationRecord

  validates_presence_of :model, :year, :price, :cost_price
  has_many :parts

end
