class CreateResearches < ActiveRecord::Migration[5.1]
  def change
    create_table :researches do |t|
      t.string :name
      t.string :topic

      t.timestamps
    end
  end
end
