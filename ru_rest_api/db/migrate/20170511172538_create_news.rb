class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :date
      t.string :catagory
      t.string :headline
      t.string :content

      t.timestamps
    end
  end
end
