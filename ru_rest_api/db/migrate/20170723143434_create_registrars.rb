class CreateRegistrars < ActiveRecord::Migration[5.1]
  def change
    create_table :registrars do |t|
      t.string :name
      t.string :about
      t.string :contact

      t.timestamps
    end
  end
end

