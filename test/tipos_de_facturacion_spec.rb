require 'rspec'
require '../lib/llamada_local'
require '../lib/utilities'
require '../lib/restriccion_horaria'
require '../lib/restriccion_dias_habiles'

describe 'El comportamiento de las distintas facturaciones' do

  context 'Una restriccion por horario'  do
    before() do
      @llamada_local= LlamadaLocal.new(9.to_hours)
    end

    it 'El costo de la llamada local deberia ser 10 centavos' do
        @llamada_local.con_facturacion(RestriccionHoraria.new(8.to_hours,20.to_hours,10.to_cents))
        @llamada_local.costo_por_minuto.should be(10.to_cents)
    end

  end

  context 'Una restriccion por horario y una restriccion por dia'  do
    before() do
      @llamada_local= LlamadaLocal.new(9.to_hours)
    end

    it 'El costo de la llamada local deberia ser 20 centavos' do
      @llamada_local.con_facturacion(RestriccionHoraria.new(8.to_hours,20.to_hours,10.to_cents))
      @llamada_local.con_facturacion(RestriccionDiasHabiles.new(10.to_cents))
      @llamada_local.costo_por_minuto.should be(20.to_cents)
    end
  end


  end