class Hour

  attr_reader :hora

  def initialize(numero)
    self.validar(numero)
    @hora=numero
  end

  def validar(numero)
    unless(numero.between?(0,24))
      raise HoraInvalidaException.new
    end
  end

  def equal?(other_hour)
    other_hour.hora.equal?(self.hora)
  end

end