class NoOrder

  attr_reader :model

  def initialize model
    @model = model
  end

  def was_successful
    false
  end

end
