require '../lib/restricciones/restriccion_de_facturacion'
class RestriccionHoraria < RestriccionDeFacturacion

  def initialize(rango_horario)
    @rango_horario=rango_horario
  end

  def costo
    10.to_cents
  end
end