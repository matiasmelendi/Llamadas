require '../lib/cod_area'

class LineaTelefonica

  attr_reader :cod_area
  attr_accessor :numero

  def initialize(cod_area,numero_telefonico)
    @cod_area=cod_area
    @numero=numero_telefonico
  end

end