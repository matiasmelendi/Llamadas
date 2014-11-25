require '../spec_helper'
require '../../util/duration'
require '../../compania_telefonica'
require '../../linea_telefonica'
require '../../server'

    before do
      Company.new.borrar_clientes
      Company.new.borrar_llamadas
    end

    def app
      Sinatra::Application
    end

    describe 'The behaviour of buscar_clientes page' do

      it 'Shouldn´t be ok, it would redirect to an 404 error page, because blah' do
        get '/seccion_clientes/buscar_cliente/'
        expect(last_response).to_not be_ok
      end

      it 'should be ok' do
        get '/seccion_clientes/buscar_cliente/?id=1'
        expect(last_response).to be_ok
      end

      it 'should redirect to an 404 error page' do
        get '/seccion_clientes/buscar_cliente/'
        lambda{follow_redirect!}
        expect(last_request.url).to eq('http://example.org/error_404')
      end

      it 'should contains "Datos del cliente" ' do
        get '/seccion_clientes/buscar_cliente/?id=1'
        expect(last_response.body).to include("Datos de Memo")
      end

      it 'should contains "Error 404" ' do
        get '/seccion_clientes/buscar_cliente/'
        lambda{follow_redirect!}
        expect(last_response.body).to include("Error 404")
      end

    end
