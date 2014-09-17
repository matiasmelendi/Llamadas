class CompaniaTelefonica

  attr_accessor :clientes

  def initialize
    @clientes=[]
  end

  def agregar_cliente(cliente)
    clientes.push(cliente)
  end


end