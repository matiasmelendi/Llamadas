require 'active_record'

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

  def eliminar_cliente(id)
    ClienteAR.find_by(_id:id).destroy
  end

  #Ver si se puede resolver de alguna manera
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

  def existe_el_cliente?(nombre)
    ClienteAR.exists?(nombre: nombre)
  end

  def llamadas_del_cliente(nombre)
    cliente=ClienteAR.find_by(nombre: nombre)
    LlamadasAR.select(emisor_id: cliente.id)
  end

  def se_realizo_llamada(emisor,receptor,duracion)
    LlamadasAR.create(emisor_id:emisor.id,id_receptor:receptor.id,duracion:duracion.value,fecha:Time.now)
  end

end