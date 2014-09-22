require '../lib/restricciones/restriccion_de_facturacion'

class RestriccionDiaria < RestriccionDeFacturacion

  def se_aplica_a(llamada)
    #SubclassResponsability
  end

  def condicion_de_aplicabilidad(llamada)
    llamada.fecha.saturday? || llamada.fecha.sunday?
  end

end