class RangoHorario

  def initialize(hora_inicial,hora_final)
    self.validate(hora_inicial,hora_final)
    @rango=hora_inicial..hora_final
  end

  def pertenece?(hora)
   @rango.member?(hora)
  end

  def validate(hora_inicial,hora_final)
    if hora_inicial > hora_final
      raise RangoHorarioInvalidoException.new
    end
  end


end