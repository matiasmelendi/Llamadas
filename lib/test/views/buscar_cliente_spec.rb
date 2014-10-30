require '../spec_helper'
require '../../util/duration'
require '../../compania_telefonica'
require '../../linea_telefonica'
require '../../server'


    def app
      Sinatra::Application
    end

    describe 'The behaviour of buscar_clientes page' do

      it 'Shouldn´t be ok, it would redirect to an 404 error page, because blah' do
        get '/buscar_cliente/'

        expect(last_response).to_not be_ok
      end

      it 'should be ok' do
        get '/buscar_cliente/?nombre=Memo'
        expect(last_response).to be_ok
      end

      it 'should redirect to an 404 error page' do
        get '/buscar_cliente/'
        follow_redirect!
        expect(last_request.url).to eq('http://example.org/error_404')
      end

      it 'should contains "Datos del cliente" ' do
        get '/buscar_cliente/?nombre=Memo'
        expect(last_response.body).to include("Datos de Memo")
      end

      it 'should contains "Error 404" ' do
        get '/buscar_cliente/'
        follow_redirect!
        expect(last_response.body).to include("Error 404")
      end

    end
