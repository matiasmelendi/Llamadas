require_relative '../spec_helper'
require '../../util/duration'
require '../../compania_telefonica'
require '../../linea_telefonica'
require '../../server'

  describe 'The behaviour of clientes home page' do

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
