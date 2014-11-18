require 'rspec'
require 'rack/test'
require 'sinatra/base'
require 'minitest/autorun'


RSpec.configure do |config|
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end