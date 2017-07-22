class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :CourseType
      t.string :CourseName
      t.string :CourseDuration

      t.timestamps
    end
  end
end
