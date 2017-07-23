class CreateCommitteeDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_details do |t|
      t.string :name
      t.string :president
      t.string :secretary

      t.timestamps
    end
  end
end
