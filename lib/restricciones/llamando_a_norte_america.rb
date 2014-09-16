require '../lib/restricciones/restriccion_por_zona'
class LlamandoANorteAmerica < RestriccionPorZona

  def costo
    70.to_cents
  end

end