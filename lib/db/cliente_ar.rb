class ClienteAR < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")

  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'cliente_ars'
      create_table :cliente_ars do |table|
        table.column :nombre,     :string
        table.column :_id, :integer
        table.column :numero, :integer
        table.column :cod_l, :integer
        table.column :cod_n, :integer
      end
    end
  end

end