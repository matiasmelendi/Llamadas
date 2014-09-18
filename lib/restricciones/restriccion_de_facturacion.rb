class RestriccionDeFacturacion

  def initialize

  end

  def costo
    
  end

  def self.tipos_de_facturacion()
    [LlamandoAEuropa,LlamandoANorteAmerica,LlamandoASudamerica,
     RestriccionDiaHabilEnHoraPico,RestriccionDiasHabiles,RestriccionFinDeSemana,
     RestriccionHoraria, SinRestriccionPorZona]
  end

  def se_aplica_a(llamada)
    #SubclassResponsability
  end

  def facturaciones_aplicadas(llamada)
    tipos_de_facturacion.select{|facturacion| facturacion.se_aplica_a(llamada) }
  end

  def costo_de_facturaciones(facturaciones)
    facturaciones.inject(0.to_f) { |result,facturacion | result + facturacion.costo  }
  end

  def self.costo_para(llamada)
    costo_de_facturaciones(facturaciones_aplicadas(llamada)) * llamada.duracion
  end
  
  
end