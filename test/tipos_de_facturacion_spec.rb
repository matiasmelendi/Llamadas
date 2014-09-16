require 'rspec'
require '../lib/llamada_local'
require '../lib/utilities'
require '../lib/restriccion_horaria'
require '../lib/restriccion_dias_habiles'
require '../lib/restriccion_fin_de_semana'
require '../lib/llamada_internacional'
require '../lib/llamando_a_norte_america'
require '../lib/llamando_a_europa'
require '../lib/llamando_a_sudamerica'
require '../lib/sin_restriccion_por_zona'

describe 'El comportamiento de las distintas facturaciones' do

  context 'Realizando una llamada local' do
    before() do
      @llamada_local= LlamadaLocal.new(9.to_hours)
    end

    context 'Una restriccion por horario'  do

      it 'El costo deberia ser 10 centavos por minuto' do
          @llamada_local.con_facturacion(RestriccionHoraria.new(8.to_hours,20.to_hours,10.to_cents))
          @llamada_local.costo_por_minuto.should be(10.to_cents)
      end
    end

    context 'Una restriccion por dia' do

      it 'Los fines de semana, la llamada local cuesta 10 centavos el minuto' do
        @llamada_local.con_facturacion(RestriccionFinDeSemana.new(10.to_cents))
        @llamada_local.costo_por_minuto.should be(10.to_cents)
      end
    end

    context 'Una restriccion por horario y una restriccion por dia'  do

      it 'El costo deberia ser 20 centavos el minuto' do
        @llamada_local.con_facturacion(RestriccionHoraria.new(8.to_hours,20.to_hours,10.to_cents))
        @llamada_local.con_facturacion(RestriccionDiasHabiles.new(10.to_cents))
        @llamada_local.costo_por_minuto.should be(20.to_cents)
      end
    end

  end

  context 'Realizando una llamada internacional' do
    before() do
      @llamada_internacional= LlamadaInternacional.new()
    end

    context 'Llamando a Norte America' do
      it 'El costo deberia ser 70 centavos por minuto' do
        @llamada_internacional.con_facturacion(LlamandoANorteAmerica.new(70.to_cents))
        @llamada_internacional.costo_por_minuto.should be(70.to_cents)
      end
    end

    context 'Llamando a Europa' do
      it 'El costo deberia ser 70 centavos por minuto' do
        @llamada_internacional.con_facturacion(LlamandoAEuropa.new(70.to_cents))
        @llamada_internacional.costo_por_minuto.should be(70.to_cents)
      end
    end

    context 'Llamando a Sudamerica' do
        it 'El costo deberia ser 50 centavos por minuto' do
          @llamada_internacional.con_facturacion(LlamandoASudamerica.new(50.to_cents))
          @llamada_internacional.costo_por_minuto.should be(50.to_cents)
        end
    end

    context 'Llamando al resto del mundo' do
      it 'El costo deberia ser 1.5 pesos' do
        @llamada_internacional.con_facturacion(SinRestriccionPorZona.new(1.50.to_pesos))
        @llamada_internacional.costo_por_minuto.should be(1.50.to_pesos)
      end
    end

  end
end