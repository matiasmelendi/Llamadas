require_relative 'restriccion_por_zona'

class LlamandoAEuropa < RestriccionPorZona

  def country_codes
    [100,101,102,103,104]
  end

  def costo
    70.to_cents
  end


end