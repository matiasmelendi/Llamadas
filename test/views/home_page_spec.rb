require '../spec_helper'
require '../../lib/util/duration'
require '../../lib/compania_telefonica'
require '../../lib/linea_telefonica'
require '../../lib/server'
require 'test/unit'

class HomePageTest < Test::Unit::TestCase
      include Rack::Test::Methods

      describe 'The behaviour of homepage' do

        RSpec.configure do |config|
          config.tty = true
          config.formatter = :documentation
          config.include Rack::Test::Methods
        end

        def app
          Sinatra::Application
        end

        it 'should be ok' do
            get '/'
            expect(last_response).to be_ok
        end

        it ' the page´s body should contains "Página de inicio" ' do
            get '/'
            expect(last_response.body).to include("Página de inicio")
        end

      end

end
