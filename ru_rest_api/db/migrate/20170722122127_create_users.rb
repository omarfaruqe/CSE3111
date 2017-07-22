class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :User_Id
      t.string :Address
      t.string :Phone

      t.timestamps
    end
  end
end
