require 'rspec'
require_relative '../compania_db'
require_relative '../linea_telefonica'
require_relative '../cod_area'
require_relative '../compania_telefonica'

describe 'The behaviour of a SQLite3DB' do

  before do
    @compania= CompaniaTelefonica.new
    @compania_db= CompaniaDB.new(@compania)
    @cliente=Cliente.new("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),@compania,1)
  end

  after do
    @compania_db.borrar_clientes
  end

  it 'should add a new client to CompaniaDB' do
      @compania_db.agregar_cliente(@cliente)
      @compania_db.clientes.size.should equal(1)
  end

  it 'should' do

  end

end