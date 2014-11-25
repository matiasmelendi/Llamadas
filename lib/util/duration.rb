class Duration

  attr_reader :minutes

  def initialize(minutes)
    @minutes=minutes
  end

  def value
    @minutes.value
  end

end