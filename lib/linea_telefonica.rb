require '../lib/cod_area'
require '../lib/exceptions/linea_invalida_exception'

class LineaTelefonica

  attr_reader :cod_area
  attr_accessor :numero

  def initialize(cod_area,numero_telefonico)
    if(numero_telefonico.to_i < 999999999)
      raise LineaInvalidaException.new
    end
    @cod_area=cod_area
    @numero=numero_telefonico
  end

end