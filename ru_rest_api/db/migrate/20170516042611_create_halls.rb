class CreateHalls < ActiveRecord::Migration[5.1]
  def change
    create_table :halls do |t|
      t.string :total_seat
      t.string :availible
      t.string :seat
      t.string :new_reculted_list
      t.string :border_info

      t.timestamps
    end
  end
end
