class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :course_name
      t.string :duration
      t.string :syllabus
      t.string :requirement
      t.string :shift

      t.timestamps
    end
  end
end
