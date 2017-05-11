class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :degree
      t.string :visit_time
      t.string :fee

      t.timestamps
    end
  end
end
