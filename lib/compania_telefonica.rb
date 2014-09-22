require '../lib/registro_de_llamadas'
require '../lib/facturador_de_llamadas'
require '../lib/util/mes_del_anio'
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
    clientes.push(Cliente.new(nombre,cod,self))
  end

  def cliente_de_nombre(nombre)
    clientes.detect(lambda{self.no_existe_el_cliente}){|cliente| nombre.eql?(cliente.nombre)}
  end

  def no_existe_el_cliente
    raise Exception.new("No existe el cliente")
  end


  def facturar_mes(mesDelAño, cliente)
    @facturador_de_llamadas.facturar_mes(mesDelAño,cliente)
  end

  def cliente_realizo_llamada_a(emisor,receptor,duracion)
    @registro_de_llamadas.nueva_llamada(emisor,receptor,duracion)
  end



end