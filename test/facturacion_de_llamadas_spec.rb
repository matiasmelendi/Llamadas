require 'rspec'
require '../lib/compania_telefonica'
require '../lib/cliente'
require '../lib/util/duration'
require '../lib/util/utilities'
require '../lib/util/mes_del_año'
require '../lib/cod_area'
require '../lib/llamada'

describe 'El comportamiento de una compania telefonica' do

  before() do
    @compania_telefonica= CompaniaTelefonica.new
    @compania_telefonica.agregar_cliente("Memo",CodArea.new(120,54))
    @compania_telefonica.agregar_cliente("EuroMemo",CodArea.new(1,101))
    @compania_telefonica.agregar_cliente("LocalMemo",CodArea.new(120,54))
    @cliente_argentino= @compania_telefonica.cliente_de_nombre("Memo")
    @receptor_europeo= @compania_telefonica.cliente_de_nombre("EuroMemo")
    @receptor_local= @compania_telefonica.cliente_de_nombre("LocalMemo")
  end

  context 'Cuando se realiza una llamada' do
    it 'Deberia almacenarse la llamada realizada' do
      @cliente_argentino.realizar_llamada(Duration.new(10.to_minutes),@receptor_europeo)
      @compania_telefonica.registro_de_llamadas.llamadas.size.should equal(1)
    end
  end

  context 'Cuando genera la factura para un cliente en un determinado mes' do

    it 'Si un cliente realiza dos llamadas en todo el mes, la factura mensual deberia cobrarle el valor de las llamadas + el costo fijo' do
      @cliente_argentino.realizar_llamada(Duration.new(10.to_minutes),@receptor_europeo)
      @cliente_argentino.realizar_llamada(Duration.new(1.to_minutes),@receptor_local)
      @factura=@compania_telefonica.facturar_mes(MesDelAño.enero(2014),@cliente_argentino)
      @factura.monto_a_pagar.should equal(17.10.to_pesos)
    end
  end
end