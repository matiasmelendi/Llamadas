require '../lib/hour'
require '../lib/cents'

class Numeric

  def to_hours
    Hour.new(self)
  end

  def to_cents
    Cents.new(self)
  end
end
