require '../lib/restricciones/restriccion_de_facturacion'

class RestriccionDiaria < RestriccionDeFacturacion

  def self.se_aplica_a(llamada)
    #SubclassResponsability
  end

  def self.condicion_de_aplicabilidad(llamada)
    llamada.fecha.saturday? || llamada.fecha.sunday?
  end

end