class Llamada

  attr_accessor :facturaciones

  def initialize
    @facturaciones= []
  end

  def costo_por_minuto
    facturaciones.inject(0.to_cents){|costo,facturacion| costo + facturacion.costo }
  end

  def con_facturacion(facturacion)
    self.facturaciones.push(facturacion)
  end


end