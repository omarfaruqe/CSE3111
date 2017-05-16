class CreateSeatplans < ActiveRecord::Migration[5.1]
  def change
    create_table :seatplans do |t|
      t.string :building_name
      t.string :floor_no
      t.string :room_no
      t.string :seat_no

      t.timestamps
    end
  end
end
