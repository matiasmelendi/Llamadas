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
    @db.execute 'CREATE TABLE IF NOT EXISTS clientes(id INTEGER PRIMARY KEY,nombre TEXT,numero INTEGER,cod_l INTEGER,cod_n INTEGER);'
    @db.execute 'CREATE TABLE IF NOT EXISTS llamadas(duracion INTEGER,id_emisor INTEGER,id_receptor INTEGER,fecha DATE);'
  end

  def agregar_cliente(cliente)
    query_struct(lambda{
      db.execute('INSERT OR REPLACE INTO clientes VALUES(?,?,?,?,?)',
                 [cliente.id,cliente.nombre,cliente.numero,cliente.cod_area.cod_local,cliente.cod_area.cod_nacional])
    })
  end


  def eliminar_cliente(id)
    query_struct(lambda{
      db.execute 'DELETE FROM clientes WHERE id=?;',[id]
    })
  end

  def actualizar_cliente(id,attr,val)
    query_struct(lambda{
      db.execute 'UPDATE clientes SET '+check(attr)+'= ? WHERE id=?;',[val,id]
    })
  end

  def existe_el_cliente?(nombre)
    query_struct(lambda{
      filtrados=db.execute 'SELECT * FROM clientes WHERE nombre=?;',[nombre]
      filtrados.count > 0
    })
  end

  def llamadas_del_cliente(nombre)
    query_struct(lambda{
      db.results_as_hash= true
      llamadas=db.execute 'SELECT * FROM clientes,llamadas WHERE clientes.nombre=?;',[nombre]
      llamadas.inject([]) { |rs,llamada|
        rs.push(Llamada.new(cliente_de_id(llamada['id_emisor']),cliente_de_id(llamada['id_receptor']),llamada['duracion'],llamada['fecha']))
      }
    })
  end

  def cliente_de_id(id)
    query_struct(lambda{
      db.results_as_hash= true
      filtrados=db.execute 'SELECT * FROM clientes WHERE id="?";',[id]
      cliente=filtrados.first
      Cliente.new(cliente['nombre'],LineaTelefonica.new(
                                            CodArea.new(cliente['cod_l'],cliente['cod_n']),cliente['numero']),@compania,cliente['id'])
    })
  end

  def se_realizo_llamada(emisor,receptor,duracion)
    query_struct(lambda{
        db.execute 'INSERT INTO llamadas VALUES(?,?,?,?)',[emisor.id,receptor.id,duracion.value,Time.now.to_s]
    })
  end

  def clientes
    query_struct(lambda{
      db.results_as_hash= true
      clientes=db.execute('SELECT * FROM clientes;')
      clientes.inject([]) { |rs,cliente|
        rs.push(Cliente.new(cliente['nombre'],
                            LineaTelefonica.new(
                                    CodArea.new(cliente['cod_l'],cliente['cod_n']),cliente['numero']),@compania,cliente['id']))
      }
    })

  end

  def borrar_clientes
    query_struct(lambda{
      db.execute 'DROP TABLE clientes ;'
    })
  end

  def borrar_llamadas
    query_struct(lambda{
      db.execute 'DROP TABLE llamadas ;'
    })
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
     exception.message
    ensure
      db.close if db
    end
  end

  private
  def check(field)
    fields= %['nombre','id','numero','cod_l','cod_n']
    if(fields.include?(field))
      field.to_s
    else
      raise SQLite3::Exception.new("Query error!")
    end
  end


end