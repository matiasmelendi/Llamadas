require_relative 'hour'
require_relative 'cents'
require_relative 'peso'
require_relative 'minute'

class Numeric

  def to_hours
    Hour.new(self)
  end

  def to_cents
    Cents.new(self)
  end

  def to_pesos
    Peso.new(self)
  end

  def to_minutes
    Minute.new(self)
  end
end
