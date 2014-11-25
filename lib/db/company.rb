require 'active_record'
require_relative 'client'
require_relative 'call'

class Company < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")

  has_many :clients

  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'companies'

      create_table :companies do

      end
    end
  end

  def to_compania_telefonica
    CompaniaTelefonica.new(clients)
  end

  def agregar_cliente(cliente)
    self.clients<<(Client.create(nombre:cliente.nombre, id:cliente.id,
                     numero:cliente.numero,cod_l:cliente.cod_area.cod_local,
                     cod_n:cliente.cod_area.cod_nacional))
  end

  def clientes
    Client.all
  end

  def llamadas
    Call.all
  end

  def eliminar_cliente(id)
    Client.find_by(id:id).destroy
  end

  def actualizar_cliente(id,attr,val)
    cliente=Client.find_by(id:id)
    begin
      cliente.update(attr.to_sym => val)
    rescue ActiveRecord::UnknownAttributeError
      "Query error!"
    end
  end

  def borrar_clientes
    Client.delete_all
  end

  def borrar_llamadas
    Call.delete_all
  end

  def existe_el_cliente?(id)
    Client.exists?(id: id)
  end

  def cliente_con_id(id)
    buscar_cliente_por('id',id)
  end

  def cliente_de_nombre(nombre)
    buscar_cliente_por('nombre',nombre)
  end

  def llamadas_del_cliente(nombre)
    cliente_de_nombre(nombre).calls
  end

  def se_realizo_llamada(emisor,receptor,duracion,fecha)
    Call.create(client_id:emisor.id,id_receptor:receptor.id,duracion:duracion.value,fecha:fecha)
  end

  private
  def buscar_cliente_por(attr,val)
    Client.find_by(attr.to_sym => val)
  end

end