require '../lib/restricciones/restriccion_por_zona'
class LlamandoAEuropa < RestriccionPorZona

  @cods= [100,101,102,103,104]

  def costo
    70.to_cents
  end


end