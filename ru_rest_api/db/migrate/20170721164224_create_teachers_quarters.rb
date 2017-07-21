class CreateTeachersQuarters < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers_quarters do |t|
      t.string :name
      t.string :block
      t.string :location

      t.timestamps
    end
  end
end
