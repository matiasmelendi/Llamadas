
class FacturadorDeLlamadas

  attr_reader :registro

  def initialize(registro_de_llamadas)
    @registro= registro_de_llamadas
  end

  def facturar_mes(mesDelAño,cliente)
    Factura.new(monto_a_pagar_para(mesDelAño,cliente))
  end

  private

  def monto_a_pagar_para(mesDelAño,cliente)
    aplicar_restricciones(registro.llamadas_del_cliente_en_el_mes(cliente,mesDelAño)).inject(0.to_pesos) { |result,value | result + value}
  end

  def aplicar_restricciones(llamadas)
    llamadas.collect{ |llamada| costo(llamada) }
  end

  def costo(llamada)
   RestriccionDeFacturacion.costo_para(llamada)
  end

end