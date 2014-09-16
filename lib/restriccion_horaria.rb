require '../lib/restriccion_de_facturacion'
class RestriccionHoraria < RestriccionDeFacturacion

  #podria reemplazarse por un rango horario
  def initialize(hora_inicial,hora_final,costo_en_cents)
    @hora_inicial=hora_inicial
    @hora_final=hora_final
    super(costo_en_cents)
  end

end