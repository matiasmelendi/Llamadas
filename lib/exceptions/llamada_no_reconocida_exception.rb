class LlamadaNoReconocidaException < Exception
  def initialize
    super("No coincide con ningun tipo de llamada conocida")
  end

end