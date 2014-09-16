class MontoInvalidoException < Exception

  def initialize
    super("Monto invalido, el valor debe ser mayor a 0")
  end
end