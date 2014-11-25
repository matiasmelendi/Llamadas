require_relative 'dummy_initialize'
require 'sinatra'
require_relative 'exceptions/no_existe_el_cliente_exception'

dummy= DummyInitialize.new

def operar_sobre_cliente(accion)
  begin
   accion[]
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

get '/' do
  erb :home
end

get '/seccion_facturaciones' do
  @meses_corrientes= dummy.meses_corrientes
  erb :home_facturaciones
end

get '/seccion_facturaciones/facturar/' do

  begin
    @date= Date.today
    anho= @date.year
    @mes_del_anho= dummy.mes_del_anho_actual
    @cliente= dummy.compania.cliente_con_id(params[:id].to_i)
    @compania= dummy.compania
    @factura= dummy.compania.facturar_mes( MesDelAnio.new(anho,params[:mes]),@cliente)
    erb :factura_emitida
  rescue
    redirect '/error_404'
  end
end


get '/seccion_clientes' do
  @clientes= dummy.clientes
  erb :home_clientes
end

get '/seccion_clientes/buscar_cliente/' do
  @compania= dummy.compania
  @mes_del_anho= dummy.mes_del_anho_actual
  operar_sobre_cliente(lambda{
                         @cliente= dummy.compania.cliente_con_id(params[:id].to_i)
                         erb :datos_del_cliente
                       })
end

get '/seccion_clientes/buscar_cliente_por_nombre/' do
  @compania= dummy.compania
  @mes_del_anho= dummy.mes_del_anho_actual
  operar_sobre_cliente(lambda{
                         @cliente= dummy.compania.cliente_de_nombre(params[:nombre])
                         erb :datos_del_cliente
                       })
end

post '/seccion_clientes/borrar_cliente/' do
  operar_sobre_cliente(lambda{
                         @clientes= dummy.clientes
                         dummy.compania.borrar_cliente(params[:id].to_i)
                         erb :lista_de_clientes
                       })
end

post '/seccion_clientes/borrar_cliente_por_nombre/' do
  operar_sobre_cliente(lambda{
                         @clientes= dummy.clientes
                         dummy.compania.borrar_cliente_de_nombre(params[:nombre])
                         erb :lista_de_clientes
                       })
end

get '/seccion_clientes/lista_de_clientes' do
  @clientes= dummy.clientes
  erb :lista_de_clientes
end

post '/seccion_clientes/crear_cliente/' do
   begin
    @clientes= dummy.clientes
    dummy.compania.agregar_cliente(params[:nombre],LineaTelefonica.new(CodArea.new(params[:cod_local],params[:cod_nacional]) ,params[:nro]))

   rescue YaExisteElClienteException, LineaInvalidaException
     erb :no_se_pudo_crear_el_cliente
   end

end

