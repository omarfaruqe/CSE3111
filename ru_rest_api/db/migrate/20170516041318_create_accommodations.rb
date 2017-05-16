class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :hall
      t.string :teacher_quarter
      t.string :stuff_quarter
      t.string :guest_house
      t.string :residence_foreignstdudent

      t.timestamps
    end
  end
end
