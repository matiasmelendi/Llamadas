require '../lib/restricciones/restriccion_diaria'
class RestriccionDiasHabiles < RestriccionDiaria

  def costo
    10.to_cents
  end

  def se_aplica_a(llamada)
    !condicion_de_aplicabilidad(llamada)
  end
end