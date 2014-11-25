class Money
  attr_reader :value

  def initialize(value)
    validate(value)
    @value=value
  end

  def +(another_money)
    #SubclassResponsability
  end

  def equal?(another_money)
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

  private
  def validate(value)
    if value < 0
      raise MontoInvalidoException.new
    end
  end
end
