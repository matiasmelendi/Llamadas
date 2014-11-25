require_relative 'llamada'
require_relative 'factura'
require_relative 'restricciones/restriccion_de_facturacion'
require_relative 'db/compania_ardb'

class RegistroDeLlamadas

  def initialize
    @bd= CompaniaARDB.new
  end

  def nueva_llamada(emisor,receptor,duracion,fecha)
    @bd.se_realizo_llamada(emisor,receptor,duracion,fecha)
  end

  def llamadas_del_cliente_en_el_mes(cliente,mes_del_anho)
   result= llamadas_del_cliente(cliente).select{ |llamada| se_realizo_en?(llamada,mes_del_anho)}
    result
  end

  def llamadas_del_cliente(cliente)
    @bd.llamadas_del_cliente(cliente.nombre).inject([]) { |result,call|
      result.push(Llamada.new(call.client, @bd.cliente_con_id(call.id_receptor), call.duracion, call.fecha)) }
  end


  def eliminar_llamadas
    @bd.borrar_llamadas
  end

  def llamadas
    @bd.llamadas
  end
private
  def realizada_por?(llamada,nombre)
    llamada.emisor.nombre.equal?(nombre)
  end

  def se_realizo_en?(llamada,mes_del_anho)
    llamada.mes.equal?(mes_del_anho.mes) && (llamada.año.equal?(mes_del_anho.año))
  end

end