class CreateVcs < ActiveRecord::Migration[5.1]
  def change
    create_table :vcs do |t|
      t.string :name
      t.string :department
      t.string :year

      t.timestamps
    end
  end
end
