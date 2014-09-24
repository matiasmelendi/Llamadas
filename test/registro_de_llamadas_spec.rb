require 'rspec'
require '../lib/compania_telefonica'
require '../lib/cod_area'
require '../lib/cliente'
require '../lib/util/numeric'
require '../lib/util/mes_del_anio'
require '../lib/linea_telefonica'


describe 'El comportamiento del registro de llamadas' do

  before() do
    @compania_telefonica= CompaniaTelefonica.new
    @compania_telefonica.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111))
    @compania_telefonica.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222))
    @cliente_argentino= @compania_telefonica.cliente_de_nombre("Memo")
    @receptor_europeo= @compania_telefonica.cliente_de_nombre("EuroMemo")
  end

  context 'Si se realiza una llamada' do
    it 'Deberia almacenarla' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      @compania_telefonica.registro_de_llamadas.llamadas.size.should eq(1)
    end
  end

  context 'Si se desea saber las llamadas de un cliente' do
    it 'Deberia retornar una lista con las llamadas de ese cliente' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      llamadas=@compania_telefonica.registro_de_llamadas.llamadas_del_cliente_en_el_mes(@cliente_argentino,MesDelAnio.septiembre(2014))
      llamadas.size.should be(1)
    end

    it 'Si no se realizaron llamadas, la lista de llamadas debe ser vacia' do
      @cliente_argentino.realizar_llamada(10.to_minutes,@receptor_europeo)
      llamadas=@compania_telefonica.registro_de_llamadas.llamadas_del_cliente_en_el_mes(@cliente_argentino,MesDelAnio.octubre(2014))
      llamadas.size.should be(0)
    end

  end

end