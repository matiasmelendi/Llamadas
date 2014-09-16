require 'rspec'
require '../lib/util/utilities'
require '../lib/exceptions/hora_invalida_exception'
require '../lib/exceptions/monto_invalido_exception'

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


end