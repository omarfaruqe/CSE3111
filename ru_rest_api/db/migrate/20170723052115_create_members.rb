class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :stdId
      t.string :contactInfo
      t.string :memberStatus

      t.timestamps
    end
  end
end
