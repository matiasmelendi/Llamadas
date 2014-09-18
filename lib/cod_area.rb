class CodArea

  attr_reader :cod_local
  attr_reader :cod_nacional

  def initialize(cod_local,cod_nacional)
    @cod_local=cod_local
    @cod_nacional=cod_nacional
  end

end