require '../lib/cod_area'
require '../lib/exceptions/linea_invalida_exception'

class LineaTelefonica

  attr_reader :cod_area
  attr_accessor :numero

  def initialize(cod_area,numero_telefonico)
    unless(es_numero_valido(numero_telefonico))
      raise LineaInvalidaException.new
    end
    @cod_area=cod_area
    @numero=numero_telefonico
  end

  def es_numero_valido(numero_telefonico)
    numero_telefonico.to_i >= 1000000000
  end
end