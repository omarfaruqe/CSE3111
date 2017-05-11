class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :class_time
      t.string :cource_name
      t.string :cource_period
      t.string :professor_name

      t.timestamps
    end
  end
end
