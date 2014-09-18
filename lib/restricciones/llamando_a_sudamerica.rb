require '../lib/restricciones/restriccion_por_zona'
class LlamandoASudamerica < RestriccionPorZona

  @cods= [50,51,52,53,54]

  def costo
    50.to_cents
  end

end