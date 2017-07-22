class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :Student_id
      t.string :Name
      t.string :Department
      t.string :Session
      t.string :eligible_status

      t.timestamps
    end
  end
end
