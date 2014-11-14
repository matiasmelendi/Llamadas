require '../restricciones/restriccion_de_facturacion'
class RestriccionHoraria < RestriccionDeFacturacion

  attr_reader :rango_horario

  def initialize(rango_horario)
    @rango_horario=rango_horario
  end

  def se_aplica_a(llamada)
    rango_horario.pertenece?(llamada.hora_de_llamada)
  end

  def costo
    10.to_cents
  end

end