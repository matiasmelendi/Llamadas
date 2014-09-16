class HoraInvalidaException < Exception

  def initialize
    super("Hora invalida,los dias tienen 24 horas")
  end

end