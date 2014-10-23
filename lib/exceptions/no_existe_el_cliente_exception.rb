class NoExisteElClienteException < Exception

  def initialize
    super("No existe el cliente")
  end

end