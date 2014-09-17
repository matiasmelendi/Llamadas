class Hour

  attr_reader :value

  def initialize(numero)
    self.validar(numero)
    @value=numero
  end

  def validar(numero)
    unless(numero.between?(0,24))
      raise HoraInvalidaException.new
    end
  end

  def equal?(other_hour)
    other_hour.value.equal?(self.value)
  end

  def >(other_hour)
    self.value > other_hour.value
  end

end