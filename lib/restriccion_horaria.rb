class RestriccionHoraria

  attr_reader :costo

  #podria reemplazarse por un rango horario
  def initialize(hora_inicial,hora_final,costo_en_cents)
    @hora_inicial=hora_inicial
    @hora_final=hora_final
    @costo=costo_en_cents
  end

end