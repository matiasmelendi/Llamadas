class Money
  attr_reader :value

  def initialize(value)
    self.validate(value)
    @value=value
  end

  def +(another_kind_of_money)

  end

  def equal?(another_kind_of_money)

  end

  def validate(value)
    if value < 0
      raise MontoInvalidoException.new
    end
  end

end