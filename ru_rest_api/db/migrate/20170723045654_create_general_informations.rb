class CreateGeneralInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :general_informations do |t|
      t.string :no_of_bus
      t.string :budget
      t.string :cost
      t.string :year

      t.timestamps
    end
  end
end
