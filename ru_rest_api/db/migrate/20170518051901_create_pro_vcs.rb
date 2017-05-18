class CreateProVcs < ActiveRecord::Migration[5.1]
  def change
    create_table :pro_vcs do |t|
      t.string :name
      t.string :department
      t.string :year

      t.timestamps
    end
  end
end
