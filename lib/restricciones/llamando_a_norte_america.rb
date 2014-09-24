require '../lib/restricciones/restriccion_por_zona'
class LlamandoANorteAmerica < RestriccionPorZona

  def country_codes
    [10,11,12,13,14]
  end

  def costo
    70.to_cents
  end

end