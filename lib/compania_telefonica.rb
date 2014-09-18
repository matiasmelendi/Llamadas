require '../lib/gestor_de_llamadas'
class CompaniaTelefonica

  attr_accessor :clientes

  def initialize
    @clientes=[]
    @gestor_de_llamadas= GestorDeLlamadas.new
  end

  def agregar_cliente(cliente)
    clientes.push(cliente)
    cliente.compania=self
  end

  def facturar_mes(mesDelAño, cliente)
    @gestor_de_llamadas.facturar_mes(mesDelAño,cliente)
  end

  def cliente_realizo_llamada_a(emisor,receptor,duracion)
    @gestor_de_llamadas.nueva_llamada(emisor,receptor,duracion)
  end



end