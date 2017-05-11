class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.string :reason
      t.string :starting_date
      t.string :ending_date

      t.timestamps
    end
  end
end
