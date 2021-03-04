class AssemblyLine < ApplicationRecord

  belongs_to :car_factory
  validates_presence_of :car_factory

end
