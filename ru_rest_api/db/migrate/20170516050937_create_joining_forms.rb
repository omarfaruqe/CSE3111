class CreateJoiningForms < ActiveRecord::Migration[5.1]
  def change
    create_table :joining_forms do |t|
      t.string :name
      t.string :student_ID
      t.string :father
      t.string :birth_date
      t.string :contact

      t.timestamps
    end
  end
end
