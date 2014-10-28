require 'rspec'
require 'rack/test'
require 'sinatra/base'

def app
  compania= CompaniaTelefonica.new
  compania.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111))
  compania.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222))
  compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("Memo"),compania.cliente_de_nombre("EuroMemo"),Duration.new(10))
  compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("EuroMemo"),compania.cliente_de_nombre("Memo"),Duration.new(10))
  compania
end

RSpec.configure do |config|
  #config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end