require 'rspec'
require_relative 'model_spec_helper'


describe 'El comportamiento del facturador de llamadas' do

  before do
    @compania_telefonica= CompaniaTelefonica.new(initialize)
    @compania_telefonica.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),1)
    @compania_telefonica.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,54),1522222222),2)
    @memo= @compania_telefonica.cliente_de_nombre("Memo")
    @euro_memo= @compania_telefonica.cliente_de_nombre("EuroMemo")
    @registro= RegistroDeLlamadas.new
    @facturador= FacturadorDeLlamadas.new(@registro)
    @calendar=Calendario.new
  end

  after do
    @compania_telefonica.eliminar_clientes
    @compania_telefonica.eliminar_llamadas
  end

  context 'Si se realiza una llamada' do

    it 'si es nacional, en dia de semana y hora pico, su costo debería ser 50 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,19,0,0)
      #nacional=30 cents, dia habil hora pico= 20 cents
      @facturador.costo(Llamada.new(@memo,@euro_memo,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.50.to_pesos)
    end

    it 'si es nacional, en fin de semana, su costo debería ser 50 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,1,21,0,0)
      #nacional=30 cents, fin de semana= 10 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,@euro_memo,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.50.to_pesos)
    end

    it 'si es local, en dia de semana y hora pico, su costo debería ser 20 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,19,0,0)
      @compania_telefonica.agregar_cliente("cliente_local",LineaTelefonica.new(CodArea.new(120,54),1533333333),3)
      cliente_local= @compania_telefonica.cliente_de_nombre("cliente_local")
      #local=0 cents, dia habil hora pico= 20 cents
      @facturador.costo(Llamada.new(@memo,cliente_local,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.20.to_pesos)
    end

    it 'si es local, en dia de semana y hora no pico, su costo debería ser 10 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,21,0,0)
      @compania_telefonica.agregar_cliente("cliente_local",LineaTelefonica.new(CodArea.new(120,54),1533333333),3)
      cliente_local= @compania_telefonica.cliente_de_nombre("cliente_local")
      #local=0 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,cliente_local,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.10.to_pesos)
    end


  end

end