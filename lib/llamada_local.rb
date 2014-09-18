require '../lib/llamada'
class LlamadaLocal < Llamada

  def initialize(emisor,receptor,duracion)
    super(emisor,receptor,duracion)
  end


  def self.es_de_tipo(cod_area_e,cod_area_r)
    cod_area_e.cod_local equal?(cod_area_r.cod_local)
  end

end