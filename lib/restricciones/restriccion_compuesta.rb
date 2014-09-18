class RestriccionCompuesta

  attr_accessor :restricciones

  def initialize(restricciones)
    @restricciones=restricciones
  end

  def costo
    restricciones.inject(0.to_pesos) { |result,restriccion | result + restriccion.costo  }
  end

  def self.se_aplica_a(llamada)
    restricciones.inject(true) { |result,restriccion | restriccion.se_aplica_a(llamada)  }
  end


end