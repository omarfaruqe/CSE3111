class CreateDigitalids < ActiveRecord::Migration[5.1]
  def change
    create_table :digitalids do |t|
      t.string :changeprocess

      t.timestamps
    end
  end
end
