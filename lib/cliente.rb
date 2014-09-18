class Cliente

  attr_reader :nombre
  attr_accessor :compania
  attr_accessor :cod_area

  @compania

  def initialize(nombre,cod_area)
    @nombre=nombre
    @cod_area=cod_area
  end

  def realizar_llamada(duracion, receptor)
    compania.cliente_realizo_llamada_a(self,receptor,duracion)
  end

end