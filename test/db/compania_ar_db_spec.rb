require_relative '../model_spec_helper'
require_relative '../db_spec_helper'

describe 'The behaviour of a ActiveRecordDB' do

  before do
    @compania= CompaniaTelefonica.new([])
    @cliente= Cliente.new("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),@compania,1)
    @cliente2= Cliente.new("Memito",LineaTelefonica.new(CodArea.new(120,54),1522222222),@compania,2)
    @compania_db= Company.new
    @calendar= Calendario.new
  end

  after do
    @compania_db.borrar_clientes
    @compania_db.borrar_llamadas
  end

  it 'should add a new client to CompaniaDB' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.clientes.size.should equal(1)
  end

  it 'should delete a client by id' do
    id= @cliente.id
    @compania_db.agregar_cliente(@cliente)
    @compania_db.eliminar_cliente(id)
    @compania_db.clientes.size.should equal(0)
  end

  it 'should update the name of client with id=1' do
    id=@cliente.id
    @compania_db.agregar_cliente(@cliente)
    @compania_db.actualizar_cliente(id,'nombre',"Matias")
    @compania_db.clientes.first.nombre.should eql("Matias")
  end

  it 'shouldn´t update the name, beacuse the property name is invalid' do
    id=@cliente.id
    @compania_db.agregar_cliente(@cliente)
    expect(@compania_db.actualizar_cliente(id,'Nombre',"Matias")).should eql?("Query error!")
  end

  it 'if I search for exists of the client "Memo" with id=1, it should return true ' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.existe_el_cliente?(@cliente.id).should be(true)
  end

  it 'should return the phone calls of the client Memo, in this case 0' do
    @compania_db.agregar_cliente(@cliente)
    (@compania_db.llamadas_del_cliente('Memo').size).should be(0)
  end

  it 'should return the phone calls of Memo, in this case 1' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.agregar_cliente(@cliente2)
    @compania_db.se_realizo_llamada(@cliente,@cliente2,Duration.new(10.to_minutes), @calendar.date_today)
    (@compania_db.llamadas_del_cliente('Memo').size).should be(1)
  end

  it 'should delete the client Memo with id=1' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.eliminar_cliente(1)
    (@compania_db.clientes.size).should equal(0)
  end

  it 'should delete the client Memo' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.eliminar_cliente_de_nombre('Memo')
    (@compania_db.clientes.size).should equal(0)
  end

end