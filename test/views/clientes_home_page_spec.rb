require '../spec_helper'
require '../../lib/util/duration'
require '../../lib/compania_telefonica'
require '../../lib/linea_telefonica'
require '../../lib/server'


class ClientesHomePage < Test::Unit::TestCase
          include Rack::Test::Methods

  describe 'The behaviour of clientes home page' do

    RSpec.configure do |config|
      config.tty = true
      config.formatter = :documentation
      config.include Rack::Test::Methods
    end

    def app
      Sinatra::Application
    end

    describe 'The behaviour of homepage' do

      it 'should be ok' do
        get '/seccion_clientes'
        expect(last_response).to be_ok
      end

      it 'should contains "Sección clientes" in the page´s body ' do
        get '/seccion_clientes'
        expect(last_response.body).to include("Sección clientes")
      end

    end
  end

end