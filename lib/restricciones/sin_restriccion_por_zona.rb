require '../lib/restricciones/restriccion_por_zona'
class SinRestriccionPorZona < RestriccionPorZona

  def costo
    1.50.to_pesos
  end

  def self.se_aplica_a(llamada)
    !condicion_de_aplicabilidad(llamada)
  end
end