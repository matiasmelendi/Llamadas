require_relative 'llamada'
require_relative 'factura'
require '../../lib/restricciones/restriccion_de_facturacion'

class RegistroDeLlamadas

  attr_reader :llamadas

  def initialize
    @llamadas=[]
  end

  def nueva_llamada(emisor,receptor,duracion)
    llamadas.push(Llamada.new(emisor,receptor,duracion))
  end


  def llamadas_del_cliente_en_el_mes(cliente,mesDelAño)
    llamadas.select{ |llamada| realizada_por?(llamada,cliente) && se_realizo_en?(llamada,mesDelAño)}
  end

  def realizada_por?(llamada,cliente)
    llamada.emisor.equal?(cliente)
  end

  def se_realizo_en?(llamada,mesDelAño)
    llamada.mes.equal?(mesDelAño.mes) && (llamada.año.equal?(mesDelAño.año))
  end

end