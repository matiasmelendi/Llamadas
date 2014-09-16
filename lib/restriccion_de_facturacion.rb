class RestriccionDeFacturacion
  attr_reader :costo

  def initialize(costo_en_cents)
    @costo= costo_en_cents
  end
end