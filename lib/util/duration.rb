class Duration

  attr_reader :value

  def initialize(minutes)
    @value=minutes.value
  end

end