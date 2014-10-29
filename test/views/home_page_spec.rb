require '../spec_helper'
require '../../lib/util/duration'
require '../../lib/compania_telefonica'
require '../../lib/linea_telefonica'

describe 'The behaviour of homepage' do

  RSpec.configure do |config|
    config.tty = true
    config.formatter = :documentation
    config.include Rack::Test::Methods
  end

  def app
   #debería poner al que le voy a consultar, pero el server no es una clase!
   #NO puede ser instanciada
  end

  describe 'The behavior of homepage' do
    it 'should be ok' do
      get '/'
      expect(last_request).to be(200)
    end

    it ' the page´s body should contains "Página de inicio" ' do
      get '/'
      expect(last_response.body).to include("Página de inicio")
    end


  end


end