class RestriccionCompuesta

  attr_accessor :restricciones

  def initialize(restricciones)
    @restricciones=restricciones
  end

  def costo
    restricciones.inject(0.to_pesos) { |result,restriccion | result + restriccion.costo}
  end

  def se_aplica_a(llamada)
    restricciones.inject(true) { |result,restriccion | result && restriccion.se_aplica_a(llamada)  }
  end
end
