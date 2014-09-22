require 'rspec'
require '../lib/util/utilities'
require '../lib/exceptions/hora_invalida_exception'
require '../lib/exceptions/monto_invalido_exception'
require '../lib/util/rango_horario'
require '../lib/exceptions/rango_horario_invalido_exception'
require 'date'

describe 'Funcionalidades extra a Numeric' do

  context 'Al enviar el mensaje to_hours a un numero' do
    it 'Deberia retornar una hora con valor de ese numero' do
      1.to_hours.should equal(Hour.new(1))
    end
  end

  context 'Al enviarle el mensaje to_hours a un numero que no corresponde al rango horario' do
    it 'No deberia poder transformarlo en hora' do
      expect{25.to_hours}.to raise_error(HoraInvalidaException)
    end
  end

  context 'Al enviarle el mensaje to_cents a un numero' do
    it 'Deberia retornar su valor en centavos' do
      25.to_cents.should equal(Cents.new(25))
    end
  end

  context 'Al enviarle el mensaje to_cents a un numero menor que cero' do
    it 'No deberia poder transformarlo a centavos' do
      expect{-25.to_cents}.to raise_error(MontoInvalidoException)
    end
  end

  context 'Al enviarle el mensaje to_pesos a un numero menor que cero' do
    it 'No deberia poder transformarlo a pesos' do
      expect{-25.to_pesos}.to raise_error(MontoInvalidoException)
    end
  end

  context 'Al enviarle el mensaje to_pesos a un numero entero' do
    it 'Deberia retornar su valor en pesos' do
      25.to_pesos.should equal(Peso.new(25))
    end
  end

  context 'Al enviarle el mensaje to_pesos a un numero racional' do
    it 'Deberia retornar su valor en pesos ' do
      25.5.to_pesos.should be(Peso.new(25.5))
    end

    it 'Su valor en centavos deberia ser la cantidad de pesos por 100 mas la cantidad de centavos' do
      (25.5.to_pesos).to_cents.should be(Cents.new(2550))
    end
  end

  context 'Al enviarle el mensaje to_pesos a Centavos' do

    it 'Si el numero es entero,deberia retornar su valor dividido 100 en pesos' do
      25.to_cents.to_pesos.should be(Peso.new(0.25))
    end

    it 'Si el numero es racional, deberia retornar su valor en pesos' do
      250.5.to_cents.to_pesos.should be(Peso.new(2.505))
    end

  end

  context 'Al enviarle el mensaje to_minutes a un numero' do
    it 'Deberia retornar su valor en minutos' do
      10.to_minutes.should be(Minute.new(10))
    end
  end

  context 'Operando sobre un rango horario' do

    before() do
      @rango_horario= RangoHorario.new(10.to_hours,12.to_hours)
    end

    it 'Al consultar si un elemento pertenece al rango' do
      @rango_horario.pertenece?(11.to_hours).should be(true)
    end

    it 'Al crear un rango con hora inicial mayor a hora final' do
      expect{RangoHorario.new(12.to_hours,11.to_hours)}.to raise_error(RangoHorarioInvalidoException)
    end

    it 'Al crear un rango con una hora invalida' do
      expect{RangoHorario.new(20.to_hours,25.to_hours)}.to raise_error(HoraInvalidaException)
    end

    it 'Cuando consulto por la hora de una fecha determinada' do
      rango=RangoHorario.new(10.to_hours,24.to_hours)
      hora=DateTime.now.to_time.hour.to_hours
      rango.pertenece?(hora).should be(true)
    end

  end

end