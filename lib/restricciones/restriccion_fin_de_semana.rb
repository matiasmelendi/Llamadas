require '../lib/restricciones/restriccion_diaria'
class RestriccionFinDeSemana < RestriccionDiaria

  def costo
    10.to_cents
  end
end