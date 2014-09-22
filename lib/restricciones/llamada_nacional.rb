require '../lib/restricciones/restriccion_por_zona'

class LlamadaNacional < RestriccionPorZona

  def costo
    30.to_cents
  end

  def se_aplica_a(llamada)
    es_llamada_nacional(llamada)
  end

end