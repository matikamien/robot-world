class Part < ApplicationRecord

  belongs_to :car
  validates_presence_of :car

end
