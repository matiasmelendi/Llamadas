require 'rspec'
require '../lib/utilities'
require '../lib/hora_invalida_exception'
require '../lib/monto_invalido_exception'

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

  context 'Al enviarle el mensaje to_cents a un numero' do
    it 'Deberia retornar su valor en centavos' do
      expect{-25.to_cents}.to raise_error(MontoInvalidoException)
    end
  end


end