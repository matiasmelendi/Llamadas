require '../restricciones/restriccion_de_facturacion'

class RestriccionPorZona < RestriccionDeFacturacion

  def se_aplica_a(llamada)
    country_codes.include?(llamada.cod_nacional) && es_llamada_internacional(llamada)
  end

  private
  def es_llamada_local(llamada)
    llamada.cod_nacional.equal?(llamada.cod_area_receptor.cod_nacional) &&
        llamada.cod_local.equal?(llamada.cod_area_receptor.cod_local)
  end

  def es_llamada_internacional(llamada)
    !es_llamada_nacional(llamada) && !es_llamada_local(llamada)
  end

  def es_llamada_nacional(llamada)
    llamada.cod_nacional.equal?(llamada.cod_area_receptor.cod_nacional) &&
        !llamada.cod_local.equal?(llamada.cod_area_receptor.cod_local)
  end


end