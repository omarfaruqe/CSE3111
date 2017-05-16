class CreateSeatPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :seat_plans do |t|
      t.string :building_name
      t.string :floor_no
      t.string :room_no
      t.string :specific_seat_no

      t.timestamps
    end
  end
end
