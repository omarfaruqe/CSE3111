class CreateDiagonises < ActiveRecord::Migration[5.1]
  def change
    create_table :diagonises do |t|
      t.string :name
      t.string :fee
      t.string :delivery_time

      t.timestamps
    end
  end
end
