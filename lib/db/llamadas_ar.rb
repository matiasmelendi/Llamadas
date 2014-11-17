class LlamadasAR < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")


  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'llamadas_ars'
      create_table :llamadas_ars do |table|
        table.column :emisor_id, :integer
        table.column :id_receptor, :integer
        table.column :duracion, :integer
        table.column :fecha, :date
      end
    end
  end

end