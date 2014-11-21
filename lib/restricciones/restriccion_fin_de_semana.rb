require_relative 'restriccion_diaria'
class RestriccionFinDeSemana < RestriccionDiaria

  def costo
    10.to_cents
  end

  def se_aplica_a(llamada)
    condicion_de_aplicabilidad(llamada)
  end

end