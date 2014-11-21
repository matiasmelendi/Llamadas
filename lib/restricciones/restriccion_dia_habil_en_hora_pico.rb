require_relative 'restriccion_de_facturacion'
require_relative 'restriccion_dias_habiles'
require_relative 'restriccion_horaria'
require_relative 'restriccion_compuesta'

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