require 'rspec'
require_relative '../util/utilities'
require_relative '../compania_db'
require_relative '../linea_telefonica'
require_relative '../cod_area'
require_relative '../compania_telefonica'

describe 'The behaviour of a SQLite3DB' do

  before do
    @compania= CompaniaTelefonica.new
    @compania_db= CompaniaDB.new(@compania)
    @cliente= Cliente.new("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),@compania,1)
    @cliente2= Cliente.new("Memito",LineaTelefonica.new(CodArea.new(120,54),1522222222),@compania,2)
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

  it 'if I search for exists of the client "Memo", it should return true ' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.existe_el_cliente?("Memo").should be(true)
  end

  it 'should return the phone calls of the client Memo, in this case 0' do
    @compania_db.agregar_cliente(@cliente)
    (@compania_db.llamadas_del_cliente("Memo").size).should equal(0)
  end

  it 'should return the phone calls of Memo, in this case 1' do
    @compania_db.agregar_cliente(@cliente)
    @compania_db.agregar_cliente(@cliente2)
    @compania_db.se_realizo_llamada(@cliente,@cliente2,Duration.new(10))
    (@compania_db.llamadas_del_cliente("Memo")).should equal(1)
  end

end