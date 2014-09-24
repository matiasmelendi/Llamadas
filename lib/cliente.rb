class Cliente

  attr_accessor :nombre
  attr_accessor :compania
  attr_accessor :linea

  def initialize(nombre,linea,compania)
    @nombre=nombre
    @linea=linea
    @compania=compania
  end

  def cod_area
    linea.cod_area
  end

  def realizar_llamada(duracion, receptor)
    compania.cliente_realizo_llamada_a(self,receptor,duracion)
  end

  def equal?(otro_cliente)
    self.nombre.eql?(otro_cliente.nombre)
  end

end