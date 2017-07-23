class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :Dormitory_name
      t.integer :Total_seat
      t.string :Notice

      t.timestamps
    end
  end
end
