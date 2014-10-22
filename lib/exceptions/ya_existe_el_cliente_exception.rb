class YaExisteElClienteException < Exception
  def initialize
    super("Ya existe el cliente")
  end
end