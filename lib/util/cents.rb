require '../lib/exceptions/monto_invalido_exception'
require '../lib/util/money'

class Cents < Money

  def +(a_cents)
    (self.value + a_cents.value).to_cents
  end

  def equal?(another_cent)
    self.value.equal?(another_cent.value)
  end

end