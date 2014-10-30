require_relative '../spec_helper'
require '../../util/duration'
require '../../compania_telefonica'
require '../../linea_telefonica'
require '../../server'


        def app
          Sinatra::Application
        end

        describe 'homepage' do
          it 'should be ok' do
            get '/'
            expect(last_response).to be_ok
          end

          it ' the page´s body should contains "Página de inicio" ' do
            get '/'
            expect(last_response.body).to include("Página de inicio")
          end

          it 'should return an exception because this page don´t redirect another page' do
            get '/'
            expect(follow_redirect!).to raise_error(Error, "Last response was not a redirect. Cannot follow_redirect!")
          end

        end