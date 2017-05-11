class CreateIctCentres < ActiveRecord::Migration[5.1]
  def change
    create_table :ict_centres do |t|
      t.string :administrator
      t.string :advisor

      t.timestamps
    end
  end
end
