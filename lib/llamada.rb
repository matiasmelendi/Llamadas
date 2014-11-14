require_relative 'exceptions/llamada_no_reconocida_exception'
require 'date'

class Llamada

  attr_accessor :fecha
  attr_reader :emisor
  attr_reader :receptor
  attr_reader :duracion

  def initialize(emisor,receptor,duracion,fecha)
    @fecha=fecha
    @emisor=emisor
    @receptor=receptor
    @duracion=duracion
  end

  def mes
    @fecha.month
  end

  def año
    @fecha.year
  end

  def hora_de_llamada
    @fecha.to_time.hour.to_hours
  end

  def cod_nacional
    emisor.cod_area.cod_nacional
  end

  def cod_local
    emisor.cod_area.cod_local
  end

  def cod_area_receptor
    receptor.cod_area
  end

  def cod_area_emisor
    emisor.cod_area
  end

  def duracion_en_minutos
    @duracion.value
  end

  def duracion
    self.duracion_en_minutos.value
  end

end