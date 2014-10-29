require '../spec_helper'
require '../../lib/util/duration'
require '../../lib/compania_telefonica'
require '../../lib/linea_telefonica'
require '../../lib/server'


class BuscarCliente < Test::Unit::TestCase
  include Rack::Test::Methods

  describe '' do

    RSpec.configure do |config|
      config.tty = true
      config.formatter = :documentation
      config.include Rack::Test::Methods
    end

    def app
      Sinatra::Application
    end

    describe 'The behaviour of clientes homepage' do


    end
  end

end