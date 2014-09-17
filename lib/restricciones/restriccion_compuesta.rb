class RestriccionCompuesta

  attr_accessor :restricciones

  def initialize(restricciones)
    @restricciones=restricciones
  end

  def costo
    restricciones.inject(0.to_pesos) { |result,restriccion | result + restriccion.costo  }
  end

end