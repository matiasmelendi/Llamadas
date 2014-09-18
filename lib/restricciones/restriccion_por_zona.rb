require '../lib/restricciones/restriccion_de_facturacion'
class RestriccionPorZona < RestriccionDeFacturacion

  attr_accessor :cods
  @cods

  def self.se_aplica_a(llamada)
    condicion_de_aplicabilidad(llamada)
  end

  def self.condicion_de_aplicabilidad(llamada)
    @cods.contains(llamada.cod_nacional)
  end

end