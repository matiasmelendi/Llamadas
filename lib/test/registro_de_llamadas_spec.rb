require 'rspec'
require_relative 'model_spec_helper'

describe 'El comportamiento del registro de llamadas' do

  before do
    @registro= RegistroDeLlamadas.new
    @compania= CompaniaTelefonica.new
    @compania.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),1)
    @compania.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222),2)
    @emisor= @compania.cliente_de_nombre("Memo")
    @receptor= @compania.cliente_de_nombre("EuroMemo")
    @calendar= Calendario.new
  end

  after do
    @compania.eliminar_clientes
    @compania.eliminar_llamadas
  end

  it 'cuando ocurre una nueva llamada, esta queda almacenada en el registro' do
    @registro.nueva_llamada(@emisor,@receptor,Duration.new(1.to_minutes),@calendar.date_today)
    @registro.llamadas_del_cliente(@emisor).size.should eq(1)
  end

  it 'cuando consulto las llamadas de un cliente que no realizo llamadas debería retornar una lista vacia' do
    @registro.llamadas_del_cliente(@emisor).should equal?([])
  end

  context 'Si un cliente realizó una llamada en enero de 2014' do

    before do
      @calendar.date_today =Date.new(2014,1,1)
      @registro.nueva_llamada(@emisor,@receptor,Duration.new(1.to_minutes),@calendar.date_today)
    end

    it 'si consultamos las llamadas de ese mes del año, debería estar almacenada' do
      @registro.llamadas_del_cliente_en_el_mes(@emisor,MesDelAnio.enero(2014)).size.should be(1)
    end

    it 'si consultamos las llamadas del mes anterior, no debería haber llamadas' do
      @registro.llamadas_del_cliente_en_el_mes(@emisor,MesDelAnio.diciembre(2013)).should equal?([])
    end

    it 'si consultamos las llamadas del mes siguiente, no debería haber llamadas' do
      @registro.llamadas_del_cliente_en_el_mes(@emisor,MesDelAnio.febrero(2014)).should equal?([])
    end

  end

end