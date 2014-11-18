require_relative 'cents'
require_relative 'peso'

class Float

  def parte_entera
    floor
  end

#####Check this
  def parte_racional
    (floor - self).magnitude
  end

  #Problems in this methods
  def to_cents
    (parte_entera + parte_racional*10).to_cents
  end

  # def to_pesos
  #   (super.to_pesos.value/100).to_pesos
  # end

end