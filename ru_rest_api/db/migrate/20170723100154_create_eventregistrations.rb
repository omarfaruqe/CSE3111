class CreateEventregistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :eventregistrations do |t|
      t.string :name
      t.string :roll
      t.string :department

      t.timestamps
    end
  end
end
