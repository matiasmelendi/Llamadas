require '../lib/restricciones/restriccion_por_zona'
class LlamandoASudamerica < RestriccionPorZona

  def costo
    50.to_cents
  end

end