class CreateHalls < ActiveRecord::Migration[5.1]
  def change
    create_table :halls do |t|
      t.string :name

      t.timestamps
    end
  end
end
