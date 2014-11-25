require_relative 'registro_de_llamadas'
require_relative 'facturador_de_llamadas'
require_relative 'cliente'
require_relative 'util/mes_del_anio'
require_relative 'exceptions/ya_existe_el_cliente_exception'
require_relative 'exceptions/no_existe_el_cliente_exception'
require_relative 'db/company'

class CompaniaTelefonica

  attr_accessor :clientes
  attr_accessor :facturador_de_llamadas
  attr_accessor :registro_de_llamadas

  def initialize
    @clientes=[]
    @registro_de_llamadas=RegistroDeLlamadas.new
    @facturador_de_llamadas= FacturadorDeLlamadas.new(@registro_de_llamadas)
    @bd= Company.new
  end

  def agregar_cliente(nombre,linea,id)
    if existe_el_cliente?(id)
       self.ya_existe_el_cliente
    end
    @bd.agregar_cliente(Cliente.new(nombre,linea,self,id))
  end

  def existe_el_cliente?(id)
    @bd.existe_el_cliente?(id)
  end

  def borrar_cliente(id)
    if not existe_el_cliente?(id)
      self.no_existe_el_cliente
    end
    @bd.eliminar_cliente(id)
  end

  def cliente_con_id(id)
    @bd.cliente_con_id(id)
  end

  def cliente_de_nombre(nombre)
    @bd.cliente_de_nombre(nombre).to_cliente
  end

  def llamadas_del_cliente(nombre,mes_del_anho)
    registro_de_llamadas.llamadas_del_cliente_en_el_mes(nombre,mes_del_anho)
  end

  def no_existe_el_cliente
    raise NoExisteElClienteException.new
  end

  def ya_existe_el_cliente
      raise YaExisteElClienteException.new
  end

  def facturar_mes(mes_del_anho, cliente)
    @facturador_de_llamadas.facturar_mes(mes_del_anho,cliente)
  end

  def cliente_realizo_llamada_a(emisor,receptor,duracion,fecha)
    registro_de_llamadas.nueva_llamada(emisor,receptor,duracion,fecha)
  end

  def eliminar_clientes
    @bd.borrar_clientes
  end

  def eliminar_llamadas
    registro_de_llamadas.eliminar_llamadas
  end

  def llamadas
    registro_de_llamadas.llamadas
  end
end