require '../lib/restricciones/restriccion_de_facturacion'
class RestriccionDiaHabilEnHoraPico < RestriccionDeFacturacion

  attr_accessor :restriccion

  def initialize(rango_horario)
    @restriccion= RestriccionCompuesta.new([RestriccionHoraria.new(rango_horario),RestriccionDiasHabiles.new])
  end

  def costo
    restriccion.costo
  end

end