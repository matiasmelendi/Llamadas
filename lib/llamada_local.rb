class LlamadaLocal

  attr_accessor :facturaciones
  attr_accessor :inicio

  def initialize(hora_inicial)
    @inicio=hora_inicial
    @facturaciones= []
  end

  def costo_por_minuto
    facturaciones.inject(0.to_cents){|costo,facturacion| costo + facturacion.costo }
  end

  def con_facturacion(facturacion)
    self.facturaciones.push(facturacion)
  end

end