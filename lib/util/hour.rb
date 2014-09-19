class Hour
  include Comparable

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

  def succ
    Hour.new(self.value + 1)
  end

  def to_s
    self.value.to_s + "hs"
  end

  def <=>(other_hour)
    (self.value) <=>  other_hour.value
  end

  def equal?(other_hour)
    (self.value).equal?(other_hour.value)
  end


  def >(other_hour)
    self.value > other_hour.value
  end

end