require 'rspec'
require_relative 'model_spec_helper'


describe 'El comportamiento del facturador de llamadas' do

  before do
    @compania_telefonica= CompaniaTelefonica.new(initialize)
    @compania_telefonica.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),1)
    @compania_telefonica.agregar_cliente("LocalMemo",LineaTelefonica.new(CodArea.new(1,54),1522222222),2)
    @memo= @compania_telefonica.cliente_de_nombre("Memo")
    @local_memo= @compania_telefonica.cliente_de_nombre("LocalMemo")
    @registro= RegistroDeLlamadas.new
    @facturador= FacturadorDeLlamadas.new(@registro)
    @calendar=Calendario.new
  end

  after do
    @compania_telefonica.eliminar_clientes
    @compania_telefonica.eliminar_llamadas
  end

  context 'Si se realiza una llamada nacional o local' do

    it 'si es nacional, en dia de semana y hora pico, su costo debería ser 50 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,19,0,0)
      #nacional=30 cents, dia habil hora pico= 20 cents
      @facturador.costo(Llamada.new(@memo,@local_memo,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.50.to_pesos)
    end

    it 'si es nacional, en fin de semana, su costo debería ser 50 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,1,21,0,0)
      #nacional=30 cents, fin de semana= 10 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,@local_memo,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.50.to_pesos)
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

  context 'si realizo una llamada internacional' do

    it 'si es a europa, hora no pico, su costo debería ser 80 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,21,0,0)
      @compania_telefonica.agregar_cliente("cliente_europeo",LineaTelefonica.new(CodArea.new(101,102),1533333333),4)
      cliente_europeo= @compania_telefonica.cliente_de_nombre("cliente_europeo")
      #europa=70 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,cliente_europeo,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.80.to_pesos)
    end

    it 'si es a sudamerica, hora no pico, su costo debería ser 60 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,21,0,0)
      @compania_telefonica.agregar_cliente("cliente_sudamericano",LineaTelefonica.new(CodArea.new(50,51),1533333333),5)
      cliente_sudamericano= @compania_telefonica.cliente_de_nombre("cliente_sudamericano")
      #sudamerica=50 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,cliente_sudamericano,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.60.to_pesos)
    end

    it 'si es a norte america, hora no pico, su costo debería ser X0 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,21,0,0)
      @compania_telefonica.agregar_cliente("cliente_norteamericano",LineaTelefonica.new(CodArea.new(10,11),1533333333),6)
      cliente_norteamericano= @compania_telefonica.cliente_de_nombre("cliente_norteamericano")
      #norte america=70 cents, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,cliente_norteamericano,Duration.new(1.to_minutes),@calendar.date_today)).should be(0.80.to_pesos)
    end

    it 'si es a cualquier otro lugar del mundo no especificado, hora no pico, su costo debería ser X0 cents por minuto' do
      @calendar.date_today = DateTime.new(2014,11,3,21,0,0)
      @compania_telefonica.agregar_cliente("cliente_X",LineaTelefonica.new(CodArea.new(1001,1002),1533333333),7)
      cliente_X= @compania_telefonica.cliente_de_nombre("cliente_X")
      #resto del mundo= 1.50 pesos, hora no pico= 10 cents
      @facturador.costo(Llamada.new(@memo,cliente_X,Duration.new(1.to_minutes),@calendar.date_today)).should be(1.60.to_pesos)
    end


  end

  context 'Cuando genera la factura para un cliente en un determinado mes' do

    it 'Si un cliente no realiza llamadas, solo deberia facturarse el costo fijo' do
      @factura=@compania_telefonica.facturar_mes(MesDelAnio.septiembre(2014),@memo)
      @factura.monto_a_pagar.should equal(10.to_pesos)
    end

    it 'Si un cliente realiza una llamada en todo el mes, la factura mensual deberia cobrarle el valor de la llamada + el costo fijo' do
      @calendar.date_today= DateTime.new(2014,11,11,18,0,0)
      @compania_telefonica.agregar_cliente("cliente_europeo",LineaTelefonica.new(CodArea.new(101,102),1533333333),4)
      cliente_europeo= @compania_telefonica.cliente_de_nombre("cliente_europeo")
      @memo.realizar_llamada(Duration.new(10.to_minutes),cliente_europeo,@calendar.date_today)
      @factura= @compania_telefonica.facturar_mes(MesDelAnio.noviembre(2014),@memo)
      #0.20 por minuto hora pico y dia habil + 0.70 * 10 minutos a Europa + costo fijo
      @factura.monto_a_pagar.should equal(19.00.to_pesos)
    end
  end

end