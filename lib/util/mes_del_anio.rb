class MesDelAnio

  attr_accessor :año
  attr_accessor :mes

  def initialize(año,mes)
    @año=año
    @mes=mes
  end

  def self.enero(año)
    new(año,1)
  end

  def self.febrero(año)
    new(año,2)
  end

  def self.marzo(año)
    new(año,3)
  end

  def self.abril(año)
    new(año,4)
  end

  def self.mayo(año)
    new(año,5)
  end

  def self.junio(año)
    new(año,6)
  end

  def self.julio(año)
    new(año,7)
  end

  def self.agosto(año)
    new(año,8)
  end

  def self.septiembre(año)
    new(año,9)
  end

  def self.octubre(año)
    new(año,10)
  end

  def self.noviembre(año)
    new(año,11)
  end

  def self.diciembre(año)
    new(año,12)
  end

end