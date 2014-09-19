require '../lib/llamada'
require '../lib/restricciones/restriccion_de_facturacion'
require '../lib/factura'

class GestorDeLlamadas

  attr_accessor :llamadas

  def initialize
    @llamadas=[]
  end

  def facturar_mes(mesDelAño,cliente)
    Factura.new(monto_a_pagar_para(mesDelAño,cliente))
  end

  def monto_a_pagar_para(mesDelAño,cliente)
    aplicar_restricciones(llamadas_del_cliente_en_el_mes(cliente,mesDelAño)).inject(0.to_f) { |result,value | result + value}
  end

  def aplicar_restricciones(llamadas)
    llamadas.each { |llamada| costo(llamada) }
  end

  def costo(llamada)
    RestriccionDeFacturacion.costo_para(llamada)
  end

  def nueva_llamada(emisor,receptor,duracion)
    Llamada.nueva_llamada(emisor,receptor,duracion)
  end


  def llamadas_del_cliente_en_el_mes(cliente,mesDelAño)
    llamadas.select{ |llamada|
        realizada_por?(llamada,cliente) && se_realizo_en?(llamada,mesDelAño)
    }
  end

  def realizada_por?(llamada,cliente)
    llamada.emisor equal?(cliente)
  end

  def se_realizo_en?(llamada,mesDelAño)
    llamada.mes equal?(mesDelAño.mes) && (llamada.año equal?(mesDelAño.año))
  end

end