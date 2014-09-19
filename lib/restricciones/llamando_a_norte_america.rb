require '../lib/restricciones/restriccion_por_zona'
class LlamandoANorteAmerica < RestriccionPorZona

  @cods= [10,11,12,13,14]

  def costo
    70.to_cents
  end

end