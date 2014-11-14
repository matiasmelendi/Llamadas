require '../restricciones/restriccion_por_zona'
class SinRestriccionPorZona < RestriccionPorZona

  def costo
    1.50.to_pesos
  end

  def country_codes
    []
  end

end