require '../lib/monto_invalido_exception'

class Cents

  attr_reader :value

  def initialize(value)
    self.validate(value)
    @value=value
  end

  def +(a_cents)
    (self.value + a_cents.value).to_cents
  end

  def equal?(another_cents)
    self.value.equal?(another_cents.value)
  end

  def validate(value)
    if value <= 0
      raise MontoInvalidoException.new
    end
  end

end