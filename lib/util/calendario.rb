class Calendario

  attr_accessor :date_today

  def initialize
    @date_today= Date.today.to_datetime
  end


end