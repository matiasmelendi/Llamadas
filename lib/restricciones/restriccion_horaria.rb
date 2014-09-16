require '../lib/restricciones/restriccion_de_facturacion'
class RestriccionHoraria < RestriccionDeFacturacion

  #podria reemplazarse por un rango horario
  def initialize(hora_inicial,hora_final)
    @hora_inicial=hora_inicial
    @hora_final=hora_final
  end

  def costo
    10.to_cents
  end
end