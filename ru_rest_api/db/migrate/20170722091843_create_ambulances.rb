class CreateAmbulances < ActiveRecord::Migration[5.1]
  def change
    create_table :ambulances do |t|
      t.string :route
      t.string :availability
      t.string :contact_number

      t.timestamps
    end
  end
end
