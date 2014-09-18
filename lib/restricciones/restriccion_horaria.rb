require '../lib/restricciones/restriccion_de_facturacion'
class RestriccionHoraria < RestriccionDeFacturacion

  def initialize(rango_horario)
    @rango_horario=rango_horario
  end

  def costo
    10.to_cents
  end

  def self.se_aplica_a(llamada)
    @rango_horario.pertenece?(llamada.hora_de_llamada)
  end

end