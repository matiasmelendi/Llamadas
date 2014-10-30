require_relative 'compania_telefonica'
require_relative 'linea_telefonica'
require_relative 'cod_area'
require_relative 'cliente'
require_relative 'util/utilities'
require 'sinatra'
require 'json'

compania= CompaniaTelefonica.new
compania.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111))
compania.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222))
compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("Memo"),compania.cliente_de_nombre("EuroMemo"),Duration.new(10))
compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("EuroMemo"),compania.cliente_de_nombre("Memo"),Duration.new(10))


def meses_corrientes
  @date= Date.today
  anho= @date.year
  mes= @date.month
  meses= (1..13).collect{|nro_mes| MesDelAnio.new(anho,nro_mes)}
  meses.select{|mes_del_anio| mes_del_anio.mes <= mes }
end

def mes_del_anho_actual
  @date= Date.today
  anho= @date.year
  mes= @date.month
  MesDelAnio.new(anho,mes)
end

get '/' do
  erb :home
end

get '/seccion_clientes' do
  @clientes=compania.clientes
  erb :home_clientes
end

get '/seccion_facturaciones' do
  @meses_corrientes= meses_corrientes
  erb :home_facturaciones
end

get '/facturar/' do

  begin
    @date= Date.today
    anho= @date.year
    @mes_del_anho= mes_del_anho_actual
    @cliente= compania.cliente_de_nombre(params[:nombre])
    @compania= compania
    @factura= compania.facturar_mes( MesDelAnio.new(anho,params[:mes]),@compania.cliente_de_nombre(params[:nombre]))
    erb :factura_emitida
  rescue
    redirect '/error_404'
  end
end

get '/buscar_cliente/' do
  begin
    @mes_del_anho= mes_del_anho_actual
    @cliente= compania.cliente_de_nombre(params[:nombre])
    @compania=compania

    erb :datos_del_cliente
  rescue NoExisteElClienteException
    redirect '/error_404'
  end
end

post '/borrar_cliente/' do
  begin
    compania.borrar_cliente(params[:nombre])

    erb :home_clientes
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

post '/crear_cliente/' do
  begin
    compania.agregar_cliente(params[:nombre],LineaTelefonica.new(CodArea.new(params[:cod_local],params[:cod_nacional]) ,params[:nro]))
    erb :cliente_creado
  rescue YaExisteElClienteException, LineaInvalidaException
    erb :no_se_pudo_crear_el_cliente
  end

end


