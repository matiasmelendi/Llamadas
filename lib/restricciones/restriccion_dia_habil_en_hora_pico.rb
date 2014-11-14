require '../restricciones/restriccion_de_facturacion'
require '../restricciones/restriccion_dias_habiles'
require '../restricciones/restriccion_horaria'
require '../restricciones/restriccion_compuesta'

class RestriccionDiaHabilEnHoraPico < RestriccionDeFacturacion
  attr_accessor :restriccion

  def initialize(rango_horario)
    @restriccion=RestriccionCompuesta.new([RestriccionHoraria.new(rango_horario),RestriccionDiasHabiles.new])
  end

  def se_aplica_a(llamada)
    restriccion.se_aplica_a(llamada)
  end

  def costo
    restriccion.costo
  end

end