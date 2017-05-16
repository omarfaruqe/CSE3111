class CreateAdmissionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :admission_details do |t|
      t.string :cost
      t.string :person_id
      t.string :admission_id
      t.string :needed_document
      t.string :last_admission_date

      t.timestamps
    end
  end
end
