require_relative 'registro_de_llamadas'
require_relative 'facturador_de_llamadas'
require_relative 'cliente'
require_relative 'util/mes_del_anio'
require_relative 'exceptions/ya_existe_el_cliente_exception'
require_relative 'exceptions/no_existe_el_cliente_exception'


class CompaniaTelefonica

  attr_accessor :clientes
  attr_accessor :facturador_de_llamadas
  attr_accessor :registro_de_llamadas

  def initialize
    @clientes=[]
    @registro_de_llamadas=RegistroDeLlamadas.new
    @facturador_de_llamadas= FacturadorDeLlamadas.new(@registro_de_llamadas)
  end

  def agregar_cliente(nombre,cod)
    if(existe_el_cliente?(nombre))
       self.ya_existe_el_cliente
    end
    clientes.push(Cliente.new(nombre,cod,self))
  end

  def existe_el_cliente?(nombre)
    clientes.count{|cliente| nombre.eql?(cliente.nombre)} > 0
  end

  def borrar_cliente(nombre)
    if(!existe_el_cliente?(nombre))
      self.no_existe_el_cliente
    end
    clientes.delete_if{|cliente| cliente.nombre.eql?(nombre)}
  end

  def cliente_de_nombre(nombre)
    clientes.detect(lambda{self.no_existe_el_cliente}){|cliente| cliente.nombre.eql?(nombre)}
  end

  def llamadas_del_cliente(nombre,mes_del_anho)
    registro_de_llamadas.llamadas_del_cliente_en_el_mes(cliente_de_nombre(nombre),mes_del_anho)
  end

  def no_existe_el_cliente
    raise NoExisteElClienteException.new
  end

  def ya_existe_el_cliente
      raise YaExisteElClienteException.new
  end

  def facturar_mes(mesDelAño, cliente)
    @facturador_de_llamadas.facturar_mes(mesDelAño,cliente)
  end

  def cliente_realizo_llamada_a(emisor,receptor,duracion)
    @registro_de_llamadas.nueva_llamada(emisor,receptor,duracion)
  end



end