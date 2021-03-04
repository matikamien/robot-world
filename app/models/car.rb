class Car < ApplicationRecord
  validates_presence_of :model
  validates_presence_of :year
  validates_presence_of :price
  validates_presence_of :cost_price
end
