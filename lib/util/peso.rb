
class Peso < Money

  def initialize(value)
    super(value)
  end

  def +(another_kind_of_money)
    another_kind_of_money.sum_with_peso(self)
  end

  def sum_with_peso(another_peso)
    (self.value + another_peso.value).to_pesos
  end

  def sum_with_cents(a_cents)
    (a_cents + self.to_cents).to_pesos
  end

  def to_pesos
    self
  end

  def to_cents
    (self.value * 100.0).to_cents
  end

  def *(a_number)
    (self.value * a_number).to_pesos
  end

  def equal?(another_peso)
    self.value==(another_peso.value)
  end

end