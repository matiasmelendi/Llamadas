require 'rspec'
require '../compania_telefonica'
require '../cliente'
require '../util/duration'
require '../util/utilities'
require '../util/mes_del_anio'
require '../cod_area'
require '../llamada'
require '../restricciones/llamando_a_europa'
require '../restricciones/llamando_a_norte_america'
require '../restricciones/llamando_a_sudamerica'
require '../restricciones/restriccion_de_facturacion'
require '../restricciones/restriccion_dia_habil_en_hora_pico'
require '../restricciones/restriccion_fin_de_semana'
require '../restricciones/sin_restriccion_por_zona'
require '../restricciones/llamada_local'
require '../restricciones/llamada_nacional'
require '../linea_telefonica'

describe 'El comportamiento de una compania telefonica' do

  before do
    @compania_telefonica= CompaniaTelefonica.new
    @compania_telefonica.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111))
    @compania_telefonica.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222))
    @compania_telefonica.agregar_cliente("LocalMemo",LineaTelefonica.new(CodArea.new(120,54),1533333333))
    @cliente_argentino= @compania_telefonica.cliente_de_nombre("Memo")
    @receptor_europeo= @compania_telefonica.cliente_de_nombre("EuroMemo")
    @receptor_local= @compania_telefonica.cliente_de_nombre("LocalMemo")
  end

  context 'Cuando genera la factura para un cliente en un determinado mes' do

    #Son contextuales(debido al uso de fechas verdaderas), variar los meses
    it 'Si un cliente no realiza llamadas, solo deberia facturarse el costo fijo' do
      @factura=@compania_telefonica.facturar_mes(MesDelAnio.septiembre(2014),@cliente_argentino)
      @factura.monto_a_pagar.should equal(10.to_pesos)
    end

    it 'Si un cliente realiza una llamada en todo el mes, la factura mensual deberia cobrarle el valor de la llamada + el costo fijo' do
      @cliente_argentino.realizar_llamada(Duration.new(1.to_minutes),@receptor_local)
      @factura=@compania_telefonica.facturar_mes(MesDelAnio.noviembre(2014),@cliente_argentino)
      @factura.monto_a_pagar.should equal(10.20.to_pesos)
    end


    it 'Si un cliente realiza dos llamadas en todo el mes, la factura mensual deberia cobrarle el valor de las llamadas + el costo fijo' do
      @cliente_argentino.realizar_llamada(Duration.new(10.to_minutes),@receptor_europeo)
      @cliente_argentino.realizar_llamada(Duration.new(1.to_minutes),@receptor_local)
      @factura=@compania_telefonica.facturar_mes(MesDelAnio.noviembre(2014),@cliente_argentino)
      #0.20 por minuto hora pico y dia habil + 0.70 * 10 minutos a Europa + costo fijo
      @factura.monto_a_pagar.should equal(17.20.to_pesos)
    end
  end
end