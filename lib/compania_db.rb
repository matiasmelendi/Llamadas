require 'sqlite3'
require_relative 'cliente'
require_relative 'linea_telefonica'
require_relative 'cod_area'

class CompaniaDB
  attr_reader :db

  def initialize(compania)
    @compania=compania

    SQLite3::Database.new 'CompaniaDB'
    @db=SQLite3::Database.open 'CompaniaDB'
    @db.execute 'CREATE TABLE IF NOT EXISTS clientes(id INTEGER,nombre TEXT,numero INTEGER,cod_l INTEGER,cod_n INTEGER)'#No uso la convención Id porque cliente tiene su propio ID
    @db.execute 'CREATE TABLE IF NOT EXISTS llamadas(Id INTEGER,duracion INTEGER,num_emisor INTEGER,num_receptor INTEGER)'
  end

  def agregar_cliente(cliente)
    query_struct(lambda{
      db.execute('INSERT INTO clientes VALUES(?,?,?,?,?)', [cliente.id,cliente.nombre,cliente.numero,cliente.cod_area.cod_local,cliente.cod_area.cod_nacional])
    })
  end

  def clientes
    query_struct(lambda{
      db.results_as_hash= true
      clientes=db.execute('SELECT * FROM clientes')
      rs=clientes.inject([]) { |rs,cliente|
        rs.push(Cliente.new(cliente['nombre'],LineaTelefonica.new(CodArea.new(cliente['cod_l'],cliente['cod_n']),cliente['numero']),@compania,cliente['id']))
      }
    })

  end

  def borrar_clientes
   @db.execute 'DROP TABLE clientes'
  end

  private
  def conectar
    SQLite3::Database.open 'CompaniaDB'
  end

  private
  def query_struct(a_block)
    begin
      db=conectar
      a_block[]
    rescue SQLite3::Exception => exception
      puts exception
    ensure
      db.close if db
    end
  end

end