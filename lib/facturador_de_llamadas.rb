require_relative 'restricciones/restriccion_de_facturacion'
require_relative 'factura'

class FacturadorDeLlamadas

  attr_reader :registro

  def initialize(registro_de_llamadas)
    @registro= registro_de_llamadas
  end

  def facturar_mes(mes_del_anho,cliente)
    monto_a_pagar = monto_a_pagar_para(mes_del_anho, cliente)
    Factura.new(monto_a_pagar)
  end


  def monto_a_pagar_para(mes_del_anho,cliente)
    llamadas = registro.llamadas_del_cliente_en_el_mes(cliente, mes_del_anho)
    aplicar_restricciones(llamadas)
  end

  def aplicar_restricciones(llamadas)
    costos = llamadas.collect { |llamada| costo(llamada) }
    costos.reduce :+
  end

  def costo(llamada)
   RestriccionDeFacturacion.costo_para(llamada)
  end

end