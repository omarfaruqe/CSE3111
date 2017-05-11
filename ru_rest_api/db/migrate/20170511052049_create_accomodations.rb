class CreateAccomodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accomodations do |t|
      t.string :categories

      t.timestamps
    end
  end
end
