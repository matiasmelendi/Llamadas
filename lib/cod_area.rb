class CodArea

  attr_reader :cod_local
  attr_reader :cod_nacional

  def initialize(cod_local,cod_nacional)
    @cod_local=cod_local
    @cod_nacional=cod_nacional
  end

  def equal?(another_cod)
    self.cod_local.eql?(another_cod.cod_local) &&
    self.cod_nacional.eql?(another_cod.cod_nacional)
  end
end