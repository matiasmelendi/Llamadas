require '../lib/exceptions/llamada_no_reconocida_exception'
require 'date'

class Llamada

  attr_accessor :fecha
  attr_reader :emisor
  attr_reader :receptor
  attr_reader :duracion

  def initialize(emisor,duracion,receptor)
    @fecha=Date.today
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
    @fecha.to_time
  end

  def duracion
    duracion.value
  end

  class << self
    require '../lib/llamada_local'
    require '../lib/llamada_nacional'
    require '../lib/llamada_internacional'

    def tipos_de_llamadas()
      [LlamadaInternacional,LlamadaLocal,LlamadaNacional]
    end

    def nueva_llamada(emisor,receptor,duracion)
      llamada=tipos_de_llamadas.find{|tipo_de_llamada| tipo_de_llamada.es_de_tipo(emisor.cod_area, receptor.cod_area)}
      llamada.new(emisor,receptor,duracion)
    end

    def es_de_tipo(cod_area_e,cod_area_r)
      #SubclassResponsability
    end

    def llamada_no_reconocida
      raise(LlamadaNoReconocidaException.new)
    end

    def to_s
      #SubclassResponsability
    end
  end

end