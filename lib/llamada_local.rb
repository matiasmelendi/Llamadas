require '../lib/llamada'
class LlamadaLocal < Llamada

  def initialize(emisor,receptor,duracion)
    super(emisor,receptor,duracion)
  end

  def to_s
    "Llamada local"
  end

  def self.es_de_tipo(cod_area_e,cod_area_r)
    cod_area_e.equal?(cod_area_r)
  end

end