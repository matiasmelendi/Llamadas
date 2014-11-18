require 'active_record'
require_relative 'cliente_ar'
require_relative 'llamadas_ar'

class CompaniaARDB

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")


  def agregar_cliente(cliente)
    ClienteAR.create(nombre:cliente.nombre,_id:cliente.id,
                     numero:cliente.numero,cod_l:cliente.cod_area.cod_local,
                     cod_n:cliente.cod_area.cod_nacional)
  end

  def clientes
    ClienteAR.all
  end

  def llamadas
    LlamadasAR.all
  end

  def eliminar_cliente(id)
    ClienteAR.find_by(_id:id).destroy
  end

  def actualizar_cliente(id,attr,val)
    cliente=ClienteAR.find_by(_id:id)
    begin
      cliente.update(attr.to_sym => val)
    rescue ActiveRecord::UnknownAttributeError
      "Query error!"
    end
  end

  def borrar_clientes
    ClienteAR.delete_all
  end

  def borrar_llamadas
    LlamadasAR.delete_all
  end

  def existe_el_cliente?(id)
    ClienteAR.exists?(_id: id)
  end

  def cliente_con_id(id)
    buscar_cliente_por('_id',id)
  end

  def cliente_de_nombre(nombre)
    buscar_cliente_por('nombre',nombre)
  end

  def llamadas_del_cliente(nombre)
    cliente=ClienteAR.find_by(nombre: nombre)
    LlamadasAR.where(emisor_id: cliente.id)
  end

  def se_realizo_llamada(emisor,receptor,duracion)
    LlamadasAR.create(emisor_id:emisor.id,id_receptor:receptor.id,duracion:duracion.value,fecha:Time.now)
  end

  private
  def buscar_cliente_por(attr,val)
    ClienteAR.find_by(attr.to_sym => val)
  end

end