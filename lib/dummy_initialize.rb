require_relative 'linea_telefonica'
require_relative 'cod_area'
require_relative 'cliente'
require_relative 'util/utilities'
require_relative 'compania_telefonica'
require_relative 'util/calendario'

class DummyInitialize
  attr_accessor :compania

  def initialize
    @compania= CompaniaTelefonica.new([])
    @calendar= Calendario.new
    compania.agregar_cliente("Memo",LineaTelefonica.new(CodArea.new(120,54),1511111111),1)
    compania.agregar_cliente("EuroMemo",LineaTelefonica.new(CodArea.new(1,101),1522222222),2)
    compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("Memo"),compania.cliente_de_nombre("EuroMemo"),Duration.new(10.to_minutes),@calendar.date_today)
    compania.cliente_realizo_llamada_a(compania.cliente_de_nombre("EuroMemo"),compania.cliente_de_nombre("Memo"),Duration.new(10.to_minutes),@calendar.date_today)
 end

  def meses_corrientes
    @date= @calendar.date_today
    anho= @date.year
    mes= @date.month
    meses= (1..13).collect{|nro_mes| MesDelAnio.new(anho,nro_mes)}
    meses.select{|mes_del_anio| mes_del_anio.mes <= mes }
  end

  def mes_del_anho_actual
    @date= @calendar.date_today
    anho= @date.year
    mes= @date.month
    MesDelAnio.new(anho,mes)
  end

  def clientes
    compania.clientes
  end
end