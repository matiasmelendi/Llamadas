require_relative 'call'

class Client < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")

  has_many :calls
  has_one :company

  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'clients'

      create_table :clients do |table|
        table.column :nombre, :string
        table.column :numero, :integer
        table.column :cod_l, :integer
        table.column :cod_n, :integer
      end
    end
  end

  def to_cliente
    Cliente.new(nombre,LineaTelefonica.new(CodArea.new(cod_l,cod_n),numero),company,id)
  end

end