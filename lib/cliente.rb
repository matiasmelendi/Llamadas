class Cliente

  attr_reader :nombre
  attr_accessor :compania
  attr_accessor :cod_area

  def initialize(nombre,cod_area,compania)
    @nombre=nombre
    @cod_area=cod_area
    @compania=compania
  end

  def realizar_llamada(duracion, receptor)
    compania.cliente_realizo_llamada_a(self,receptor,duracion)
  end

  def equal?(otro_cliente)
    self.nombre.eql?(otro_cliente.nombre)
  end

end