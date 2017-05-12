class CreateHalls < ActiveRecord::Migration[5.1]
  def change
    create_table :halls do |t|
      t.string :StudentName
      t.string :StudentId
      t.string :HallName

      t.timestamps
    end
  end
end
