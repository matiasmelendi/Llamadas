class Factura

  def initialize(monto_a_pagar)
    @monto=monto_a_pagar
  end

  def impuesto_fijo
    10.to_f
  end

  def monto_a_pagar
    (@monto + impuesto_fijo).to_pesos
  end

end