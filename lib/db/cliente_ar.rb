require_relative 'llamadas_ar'

class ClienteAR < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")

  self.table_name ='clientes'

  #has_many :llamadas_ars

  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'clientes'

      create_table :clientes do |table|
        table.column :nombre, :string
        table.column :numero, :integer
        table.column :cod_l, :integer
        table.column :cod_n, :integer
      end
    end
  end


end