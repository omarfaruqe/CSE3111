class CreateBusSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :bus_schedules do |t|
      t.string :types

      t.timestamps
    end
  end
end
