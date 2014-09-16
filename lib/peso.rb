require '../lib/money'
class Peso < Money

  def initialize(value)
    super(value)
  end

  def +(another_peso)
    (self.value + another_peso.value).to_pesos
  end

  def to_cents
    (self.value * 100).to_int.to_cents
  end

  def equal?(another_peso)
    self.value.equal?(another_peso.value)
  end

end