class Minute
  attr_reader :value
  def initialize(value)
    @value=value
  end

  def equal?(another_minute)
    self.value.equal?(another_minute.value)
  end


end