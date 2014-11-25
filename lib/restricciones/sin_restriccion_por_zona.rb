require_relative 'restriccion_por_zona'
class SinRestriccionPorZona < RestriccionPorZona

  def costo
    1.50.to_pesos
  end

  def country_codes
    [1001,1002,1003,1004]
  end

end