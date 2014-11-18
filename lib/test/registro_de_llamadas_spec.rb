require 'rspec'
require '../compania_telefonica'
require '../cod_area'
require '../cliente'
require '../util/numeric'
require '../util/mes_del_anio'
require '../linea_telefonica'


describe 'El comportamiento del registro de llamadas' do

  before do
    @compania_telefonica= CompaniaTelefonica.new
    @compania_telefonica.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),1)
    @compania_telefonica.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222),2)
    @cliente_argentino= @compania_telefonica.cliente_de_nombre("Memo")
    @receptor_europeo= @compania_telefonica.cliente_de_nombre("EuroMemo")
  end

  after do
    @compania_telefonica.eliminar_clientes
    @compania_telefonica.eliminar_llamadas
  end

  context 'Si se realiza una llamada' do
    it 'Deberia almacenarla' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      @compania_telefonica.llamadas.size.should eq(1)
    end
  end

  #Son contextuales(debido al uso de fechas verdaderas), variar los meses
  context 'Si se desea saber las llamadas de un cliente' do
    it 'Deberia retornar una lista con las llamadas de ese cliente' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      llamadas=@compania_telefonica.llamadas_del_cliente(@cliente_argentino.nombre,MesDelAnio.noviembre(2014))
      llamadas.size.should be(1)
    end

    it 'Si no se realizaron llamadas, la lista de llamadas debe ser vacia' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      llamadas=@compania_telefonica.llamadas_del_cliente(@cliente_argentino.nombre,MesDelAnio.octubre(2014))
      llamadas.size.should be(0)
    end

  end

end