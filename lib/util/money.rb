class Money
  attr_reader :value

  def initialize(value)
    self.validate(value)
    @value=value
  end


  def validate(value)
    if value < 0
      raise MontoInvalidoException.new
    end
  end

  def +(another_kind_of_money)
    #SubclassResponsability
  end

  def equal?(another_kind_of_money)
    #SubclassResponsability
  end

  def to_pesos
    #SubclassResponsability
  end

  def to_cents
    #SubclassResponsability
  end

  def sum_with_peso(a_peso)
    #SubclassResponsability
  end

  def sum_with_cents(a_cent)
    #SubclassResponsability
  end

end