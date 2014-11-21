require_relative 'restriccion_por_zona'

class LlamadaLocal < RestriccionPorZona

  def costo
    0.to_cents
  end

  def se_aplica_a(llamada)
    llamada.cod_area_emisor.equal?(llamada.cod_area_receptor)
  end

end