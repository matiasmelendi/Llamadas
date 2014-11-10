require_relative 'dummy_initialize'
#require 'app/js/controllers.js'
require 'sinatra'
require 'json'

dummy= DummyInitialize.new

get '/' do
  erb :home
end

get '/seccion_clientes' do
  @clientes= dummy.clientes
  erb :home_clientes
end

get '/seccion_facturaciones' do
  @meses_corrientes= dummy.meses_corrientes
  erb :home_facturaciones
end

get '/facturar/' do

  begin
    @date= Date.today
    anho= @date.year
    @mes_del_anho= dummy.mes_del_anho_actual
    @cliente= dummy.compania.cliente_de_nombre(params[:nombre])
    @compania= dummy.compania
    @factura= dummy.compania.facturar_mes( MesDelAnio.new(anho,params[:mes]),@compania.cliente_de_nombre(params[:nombre]))
    erb :factura_emitida
  rescue
    redirect '/error_404'
  end
end

get '/buscar_cliente/' do
  begin
    @mes_del_anho= dummy.mes_del_anho_actual
    @cliente= dummy.compania.cliente_de_nombre(params[:nombre])
    @compania= dummy.compania

    erb :datos_del_cliente
  rescue NoExisteElClienteException
    redirect '/error_404'
  end
end

post '/borrar_cliente/' do
  begin
    dummy.compania.borrar_cliente(params[:nombre])
    redirect 'seccion_clientes'
  rescue NoExisteElClienteException
    redirect '/error_404'
  end
end

not_found do
  status 404
  erb :error_404
end

get '/error_404' do
  status 404
end

post '/seccion_clientes/crear_cliente/' do
   begin
    dummy.compania.agregar_cliente(params[:nombre],LineaTelefonica.new(CodArea.new(params[:cod_local],params[:cod_nacional]) ,params[:nro]))
    redirect '/seccion_clientes'
   rescue YaExisteElClienteException, LineaInvalidaException
     erb :no_se_pudo_crear_el_cliente
   end

end

