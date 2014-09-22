require '../lib/util/cents'
require '../lib/util/peso'

class Float

  def parte_entera
    self.truncate
  end

  def parte_racional
    (self.truncate - self).magnitude
  end

  def to_cents
    (self.parte_entera*100).to_cents + (self.parte_racional.to_cents)
  end

  def to_pesos
    self.parte_entera.to_pesos + (self.parte_racional.to_cents)
  end

end