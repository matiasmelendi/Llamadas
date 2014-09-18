class MesDelAño

  attr_reader :año
  attr_accessor :mes

  def initialize(año)
    @año=año
  end

  def self.crear_mes(año,mes)
    @mes=mes
    new(año)
  end

  def self.enero(año)
    self.crear_mes(año,1)
  end

  def self.febrero(año)
    self.crear_mes(año,2)
  end

  def self.marzo(año)
    self.crear_mes(año,3)
  end

  def self.abril(año)
    self.crear_mes(año,4)
  end

  def self.mayo(año)
    self.crear_mes(año,5)
  end

  def self.junio(año)
    self.crear_mes(año,6)
  end

  def self.julio(año)
    self.crear_mes(año,7)
  end

  def self.agosto(año)
    self.crear_mes(año,8)
  end

  def self.septiembre(año)
    self.crear_mes(año,9)
  end

  def self.octubre(año)
    self.crear_mes(año,10)
  end

  def self.noviembre(año)
    self.crear_mes(año,11)
  end

  def self.diciembre(año)
    self.crear_mes(año,12)
  end

end