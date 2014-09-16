require '../lib/llamada'
class LlamadaLocal < Llamada

  attr_accessor :inicio

  def initialize(hora_inicial)
    super()
    @inicio=hora_inicial
  end

end