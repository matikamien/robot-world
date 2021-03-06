class Part < ApplicationRecord

  belongs_to :car
  validates_presence_of :car
  has_one :defect

  def set_defect defect
    @defect = defect
  end

  def has_defect
    @defect.is_defect
  end

end
