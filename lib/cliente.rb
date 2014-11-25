class Cliente

  attr_accessor :nombre
  attr_accessor :compania
  attr_accessor :linea
  attr_accessor :id

  def initialize(nombre,linea,compania,id)
    @nombre=nombre
    @linea=linea
    @compania= compania
    @id=id
  end

  def cod_area
    linea.cod_area
  end

  def numero
    linea.numero
  end

  def realizar_llamada(duracion, receptor,fecha)
    compania.cliente_realizo_llamada_a(self,receptor,duracion,fecha)
  end

  def equal?(otro_cliente)
    self.id.eql?(otro_cliente.id)
  end

end