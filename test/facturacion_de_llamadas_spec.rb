require 'rspec'

describe 'El comportamiento de una compania telefonica' do

  context 'Cuando genera la factura para un cliente en un determinado mes' do
    before() do
      @compania_telefonica= CompaniaTelefonica.new
      @cliente_argentino= Cliente.new("Memo")
      @compania_telefonica.agregar_cliente(@cliente)

    end

    it 'Si un cliente realiza dos llamadas en todo el mes, la factura mensual deberia cobrarle el valor de las llamadas + el costo fijo' do
      @cliente_argentino.realizar_llamada(Duration.new(10.to_minutes),@receptor_europeo)#Cliente_realizo_llamada(cliente,llamada)
      @cliente_argentino.realizar_llamada(Duration.new(1.to_minutes),@receptor_local)
      @factura=@compania_telefonica.facturar_mes(MesDelAño.enero(2014),@cliente_argentino)
      @factura.monto_a_pagar().should equal(17.10.to_pesos)
    end
  end
end