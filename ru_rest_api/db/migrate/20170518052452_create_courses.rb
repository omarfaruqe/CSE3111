class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :catagory
      t.string :professor
      t.string :credit

      t.timestamps
    end
  end
end
