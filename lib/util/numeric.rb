require '../lib/util/hour'
require '../lib/util/cents'
require '../lib/util/peso'

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
end
