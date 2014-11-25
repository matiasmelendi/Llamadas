require_relative '../util/rango_horario'


class RestriccionDeFacturacion

  def costo
    #SubclassResponsability
  end

  def se_aplica_a(llamada)
    #SubclassResponsability
  end

class << self

    def tipos_de_facturacion
      [
          LlamandoAEuropa.new,LlamandoANorteAmerica.new,LlamandoASudamerica.new,
          RestriccionFinDeSemana.new,SinRestriccionPorZona.new,
          RestriccionDiaHabilEnHoraPico.new(RangoHorario.new(8.to_hours,20.to_hours)),
          LlamadaLocal.new,LlamadaNacional.new, RestriccionHoraria.new(RangoHorario.new(20.to_hours,24.to_hours)),
          RestriccionHoraria.new(RangoHorario.new(0.to_hours,8.to_hours))
      ]
    end

    def costo_para(llamada)
      costo_de_facturaciones(facturaciones_aplicadas(llamada)) * llamada.duracion
    end

private
    def facturaciones_aplicadas(llamada)
     tipos_de_facturacion.select{|facturacion| facturacion.se_aplica_a(llamada)}
    end

    def costo_de_facturaciones(facturaciones)
      facturaciones.inject(0.to_pesos) { |result,facturacion | result + facturacion.costo}
    end

end
end