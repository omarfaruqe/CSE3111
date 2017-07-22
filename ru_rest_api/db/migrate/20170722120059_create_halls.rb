class CreateHalls < ActiveRecord::Migration[5.1]
  def change
    create_table :halls do |t|
      t.integer :Hall_Id
      t.string :Hall_Name
      t.string :Provost_Name
      t.integer :Capacity

      t.timestamps
    end
  end
end
