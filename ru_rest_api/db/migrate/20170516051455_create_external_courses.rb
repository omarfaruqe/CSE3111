class CreateExternalCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :external_courses do |t|
      t.string :course_type

      t.timestamps
    end
  end
end
