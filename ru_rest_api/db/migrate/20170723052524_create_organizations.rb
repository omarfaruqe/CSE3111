class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :organization_type
      t.string :total_member
      t.string :objective_and_policy

      t.timestamps
    end
  end
end
