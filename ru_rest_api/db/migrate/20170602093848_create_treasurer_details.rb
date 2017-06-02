class CreateTreasurerDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :treasurer_details do |t|
      t.string :name
      t.string :about
      t.string :extreasurers

      t.timestamps
    end
  end
end
