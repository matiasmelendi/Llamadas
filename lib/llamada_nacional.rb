require '../lib/llamada'
class LlamadaNacional < Llamada


  def costo_por_minuto
    30.to_cents
  end

  def self.es_de_tipo(cod_area_e,cod_area_r)
    cod_area_e.cod_nacional equal?(cod_area_r.cod_nacional)
  end


end