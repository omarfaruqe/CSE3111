class CreateBusSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :bus_schedules do |t|
      t.integer :bus_id
      t.string :time
      t.string :starting_place
      t.string :destination
      t.string :bus_type

      t.timestamps
    end
  end
end
