require '../lib/restricciones/restriccion_diaria'
class RestriccionDiasHabiles < RestriccionDiaria

  def costo
    10.to_cents
  end
end