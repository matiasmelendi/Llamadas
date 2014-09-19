require '../lib/llamada'
class LlamadaInternacional < Llamada

  def initialize(emisor,receptor,duracion)
    super(emisor, receptor,duracion)
  end

  def to_s
    "Llamada internacional"
  end

  def self.es_de_tipo(cod_area_e,cod_area_r)
      !cod_area_e.cod_nacional.equal?(cod_area_r.cod_nacional)
  end
end