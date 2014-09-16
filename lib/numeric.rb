require '../lib/hour'

class Numeric

  def to_hours
    Hour.new(self)
  end

end