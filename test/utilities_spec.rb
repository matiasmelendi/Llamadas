require 'rspec'
require '../lib/utilities'
require '../lib/hora_invalida_exception'

describe 'Funcionalidades extra a Numeric' do

  context 'Al enviar el mensaje to_hours a un numero' do
    it 'Deberia retornar una hora con valor de ese numero' do
      1.to_hours.should equal(Hour.new(1))
    end
  end

  context 'Al enviarle el mensaje to_hours a un numero que no corresponde al rango horario' do
    it 'No deberia poder transformarlo en hora' do
      expect{25.to_hours}. to raise_error(HoraInvalidaException.new)
    end
  end

end