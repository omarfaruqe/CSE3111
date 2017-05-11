class CreateIds < ActiveRecord::Migration[5.1]
  def change
    create_table :ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
