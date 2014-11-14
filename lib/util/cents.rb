require_relative '../exceptions/monto_invalido_exception'
require_relative 'money'

class Cents < Money

  def +(another_money)
    another_money.sum_with_cents(self)
  end

  def equal?(another_cent)
    self.value==(another_cent.value)
  end

  def *(a_number)
    (self.value * a_number).to_cents
  end

  def sum_with_peso(a_peso)
    a_peso.sum_with_cents(self)
  end

  def sum_with_cents(a_cents)
    (self.value + a_cents.value).to_cents
  end

  def to_cents
    self
  end

  def to_pesos
    (self.value/(100.0)).to_pesos
  end

end