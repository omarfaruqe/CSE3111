class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :bus_id
      t.string :departure_time
      t.string :destination

      t.timestamps
    end
  end
end
