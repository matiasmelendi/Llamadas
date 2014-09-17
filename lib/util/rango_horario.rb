class RangoHorario

  def initialize(hora_inicial,hora_final)
    self.validate(hora_inicial,hora_final)
    @hora_inicial=hora_inicial
    @hora_final=hora_final
  end

  def pertenece(hora)
   hora.value.between?(@hora_inicial.value,@hora_final.value)
  end

  def validate(hora_inicial,hora_final)
    if hora_inicial > hora_final
      raise RangoHorarioInvalidoException.new
    end
  end


end