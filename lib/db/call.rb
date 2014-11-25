require_relative 'client'

class Call < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "/home/memonono/RubymineProjects/llamadas/lib/db/compania_ar_db.db")

  belongs_to :client

  ActiveRecord::Schema.define do
    unless ActiveRecord::Base.connection.tables.include? 'calls'
      create_table :calls do |table|
        table.column :client_id , :integer
        table.column :id_receptor, :integer
        table.column :duracion, :integer
        table.column :fecha, :datetime
      end
    end
  end

end